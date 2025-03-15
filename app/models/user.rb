class User < ApplicationRecord
  has_secure_password

  # Allowed email domains and username format validations
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@(gmail\.com|yahoo\.com|hotmail\.com|aol\.com|outlook\.com)\z/i
  VALID_USERNAME_REGEX = /\A[a-zA-Z0-9_]+\z/

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true,
                       uniqueness: { case_sensitive: false },
                       format: { with: VALID_USERNAME_REGEX, message: "can only contain letters, numbers, and underscores" }
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGEX, message: "must be from Gmail, Yahoo, Hotmail, AOL, or Outlook" }
  validates :password, length: { minimum: 8 }, if: -> { new_record? || !password.nil? }

  # Custom validation for username availability and suggestions
  validate :username_availability, on: :create

  def username_availability
    if User.where("lower(username) = ?", username.downcase).exists?
      errors.add(:username, "is already taken. Suggestions: #{suggest_alternatives.join(', ')}")
    end
  end

  def suggest_alternatives
    ["#{username}123", "#{username}_1", "#{username}2025"]
  end

  # Custom validation for password to include at least one special character
  validate :password_must_have_special_character, if: -> { password.present? }

  def password_must_have_special_character
    unless password =~ /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/
      errors.add(:password, "must include at least one special character")
    end
  end

  # Methods for password reset functionality
  def generate_reset_token!
    self.reset_password_token = SecureRandom.urlsafe_base64(20)
    self.reset_password_token_expires_at = 2.hours.from_now
    save!
  end

  def clear_reset_token!
    self.reset_password_token = nil
    self.reset_password_token_expires_at = nil
    save!
  end
end
