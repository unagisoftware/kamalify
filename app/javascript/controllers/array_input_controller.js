import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["container", "template"]

  add() {
    this.containerTarget.appendChild(this.#newInput())
  }

  remove(event) {
    const inputContainer = event.currentTarget.parentElement

    inputContainer.remove()
  }

  // private

  #newInput() {
    return this.templateTarget.content.cloneNode(true)
  }
}
