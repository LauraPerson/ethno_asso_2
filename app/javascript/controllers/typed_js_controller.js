import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["Ethno", "<h2>Observer . Questionner . Analyser</h2>"],
      typeSpeed: 40,
      loop: true
    })
  }
}
