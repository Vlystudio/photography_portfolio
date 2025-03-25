import { Application } from "@hotwired/stimulus";

const application = Application.start();

// Configure Stimulus development experience (optional)
application.debug = false;
window.Stimulus = application;

// Eager-load all controllers from this folder
const controllers = import.meta.glob("./**/*_controller.js", { eager: true });

// Automatically register each controller.
for (const path in controllers) {
  const controllerModule = controllers[path];
  // Extract the controller name from the file path (e.g. "./example_controller.js" => "example")
  const controllerName = path.split("/").pop().replace("_controller.js", "");
  application.register(controllerName, controllerModule.default);
}

export { application };