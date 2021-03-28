import { Controller } from "stimulus";

export default class ApplicationController extends Controller {
  get pageIsPreview() {
    return document.documentElement.hasAttribute("data-turbolinks-preview");
  }
}
