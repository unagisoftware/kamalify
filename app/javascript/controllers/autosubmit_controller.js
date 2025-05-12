import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["format", "form", "dynamicInput"];

  dynamicInputTargetDisconnected() {
    this.submit();
  }

  submit({ params }) {
    if (params.format === "yaml") {
      this.formatTarget.value = "yaml";
      this.formTarget.setAttribute("data-turbo", "false")
    } else {
      this.formatTarget.value = "html";
      this.formTarget.setAttribute("data-turbo", "true")
    }

    clearTimeout(this.timeout);
    this.timeout = setTimeout(() => {
      this.formTarget.requestSubmit();
    }, 500); // Prevent excessive submissions
  }
}
