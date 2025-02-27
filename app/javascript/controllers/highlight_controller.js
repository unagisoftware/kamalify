import { Controller } from "@hotwired/stimulus";
import hljs from "highlight.js"


export default class extends Controller {
  connect() {
    this.element.querySelectorAll("pre code").forEach((block) => {
      hljs.highlightElement(block);
    });
  }
}