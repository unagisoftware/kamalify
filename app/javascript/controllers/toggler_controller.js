import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggler"
export default class extends Controller {
  static targets = [ "target" ]

  toggle(event) {
    this.targetTarget.classList.toggle("hidden")
    this.#toggleInputs(!event.currentTarget.checked)
  }

  #toggleInputs(disabled) {
    const inputs = this.targetTarget.querySelectorAll("input")

    for (const input of inputs) {
      input.disabled = disabled
    }
  }
}
