import { Controller } from "stimulus";

export default class extends Controller {
  static values = {
    copyable: String,
  };

  copy() {
    this.createTextareaAndCopy();
    this.updateAriaLabel();
  }

  createTextareaAndCopy() {
    const textarea = document.createElement("textarea");
    textarea.value = this.copyableValue;
    textarea.style.position = "fixed";
    textarea.style.left = "-9999999px";
    document.body.appendChild(textarea);
    textarea.focus();
    textarea.select();
    document.execCommand("copy");
    document.body.removeChild(textarea);
  }

  updateAriaLabel() {
    this.element.setAttribute("aria-label", "Copied");

    this.timeoutId = setTimeout(() => {
      this.element.setAttribute("aria-label", "Copy");
    }, 2000);
  }

  disconnect() {
    if (this.timeoutId) {
      clearTimeout(this.timeoutId);
    }
  }
}
