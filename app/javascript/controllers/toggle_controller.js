import ApplicationController from "./application_controller";

export default class extends ApplicationController {
  static values = { attribute: String };
  static targets = ["toggleable"];

  connect() {
    if (this.pageIsPreview) {
      this.disableRender();
    }
  }

  toggle() {
    this.toggleableTargets.forEach((element) => {
      if (element.hasAttribute(this.attributeValue)) {
        element.removeAttribute(this.attributeValue);
      } else {
        element.setAttribute(this.attributeValue, "");
      }
    });
  }

  disableRender() {
    this.toggleableTargets.forEach((element) => {
      if (element.hasAttribute(this.attributeValue)) {
        element.setAttribute("hidden", "");
      }
    });
  }
}
