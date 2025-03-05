import { Controller } from "@hotwired/stimulus";
import hljs from "highlight-js"
import yaml from "highlight-yaml";

hljs.registerLanguage("yaml", yaml);

export default class extends Controller {
  connect() {
    this.highlightCode();
  }

  highlightCode() {
    console.log("highlight triggered");
    document.querySelectorAll("code.yaml").forEach((el) => {
      hljs.highlightElement(el);
    });
  }
}
