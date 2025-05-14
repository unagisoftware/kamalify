import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { content: String }
  static targets = [ "message" ]

  async copy(event) {
    event.preventDefault()
    this.reset()

    try {
      await navigator.clipboard.writeText(this.contentValue)
      this.messageTarget.classList.add('fade-in')
      this.#hideMessage()
    } catch {}
  }

  reset() {
    this.messageTarget.classList.remove('fade-in')
    this.messageTarget.classList.remove('fade-out')
  }

  #hideMessage() {
    setTimeout(()=> {
      this.messageTarget.classList.add('fade-out')
    }, 2000);
  }
}

