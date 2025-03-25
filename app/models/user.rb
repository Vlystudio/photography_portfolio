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

  # Suggest alternatives by appending random numbers.
  def suggest_alternatives
    [
      "#{username}#{rand(100..999)}",
      "#{username}_#{rand(10..99)}",
      "#{username}#{rand(1000..9999)}"
    ]
  end

  # Custom validation for password to include at least one special character
  validate :password_must_have_special_character, if: -> { password.present? }

  def password_must_have_special_character
    unless password =~ /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/
      errors.add(:password, "must include at least one special character")
    end
  end

  # Methods for advanced password reset functionality:

  # Generates a secure token and sets its expiration (24 hours from now).
  def generate_password_reset_token!
    update!(
      reset_password_token: SecureRandom.urlsafe_base64,
      reset_password_token_expires_at: Time.current + 24.hours
    )
  end

  # Checks if the reset token is still valid (i.e. not expired).
  def password_reset_token_valid?
    reset_password_token_expires_at && reset_password_token_expires_at > Time.current
  end

  # Clears the reset token and its expiration timestamp.
  def clear_password_reset_token!
    update!(reset_password_token: nil, reset_password_token_expires_at: nil)
  end
end