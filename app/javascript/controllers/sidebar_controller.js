import ApplicationController from "./application_controller";

export default class extends ApplicationController {
  static targets = ["aside"];

  connect() {
    if (this.pageIsPreview) {
      this.asideTarget.setAttribute("hidden", "");
    }
  }

  show() {
    this.asideTarget.classList.add("active");
  }

  hide() {
    this.asideTarget.classList.remove("active");
  }
}
