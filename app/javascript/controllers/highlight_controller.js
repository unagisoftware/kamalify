import { Controller } from "@hotwired/stimulus";
import hljs from "highlight-js"
import yaml from "highlight-yaml";

hljs.registerLanguage("yaml", yaml);

export default class extends Controller {
  connect() {
    this.element.querySelectorAll("pre code").forEach((block) => {
      hljs.highlightElement(block);
    });
  }
}
