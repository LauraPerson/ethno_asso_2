import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter"
export default class extends Controller {
  static targets = ["button"]

  // active(e) {
    // e.preventDefault()
  //   if (this.buttonTarget.className == "filter-unactive") {
  //     this.buttonTarget.classList.remove("display-none")
  //     this.buttonTarget.classList.add("display")
  //   } else {
  //     this.buttonTarget.classList.remove("display")
  //     this.buttonTarget.classList.add("display-none")
  //   }
  // }
}
