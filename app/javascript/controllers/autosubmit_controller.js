import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["dynamicInput"];

  dynamicInputTargetDisconnected() {
    this.submit();
  }

  submit() {
    clearTimeout(this.timeout);
    this.timeout = setTimeout(() => {
      this.element.requestSubmit();
    }, 500); // Prevent excessive submissions
  }
}
