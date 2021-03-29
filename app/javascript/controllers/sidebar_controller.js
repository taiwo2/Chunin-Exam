import ApplicationController from "./application_controller";

export default class extends ApplicationController {
  static targets = ["aside"];

  show() {
    this.asideTarget.classList.add("active");
  }

  hide() {
    this.asideTarget.classList.remove("active");
  }
}
