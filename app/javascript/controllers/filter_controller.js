import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter"
export default class extends Controller {
  static targets = ["button"]

  active(e) {
    // e.preventDefault()
    // console.log(e.currentTarget)
    // e.currentTarget.classList.add("active_background")
  }

  // active(e) {
  //   if (this.buttonTarget.className == "filter-unactive") {
  //     this.buttonTarget.classList.remove("display-none")
  //     this.buttonTarget.classList.add("display")
  //   } else {
  //     this.buttonTarget.classList.remove("display")
  //     this.buttonTarget.classList.add("display-none")
  //   }
  // }
}
