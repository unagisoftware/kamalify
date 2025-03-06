import { Controller } from "@hotwired/stimulus";
import hljs from "highlight-js"
import yaml from "highlight-yaml";

hljs.registerLanguage("yaml", yaml);

export default class extends Controller {
  static targets = ["code"]

  connect() {
    hljs.highlightElement(this.codeTarget)
  }
}
