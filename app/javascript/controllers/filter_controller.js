import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter"
export default class extends Controller {
  static targets = ["button"]

  active(e) {
    // console.log("TEST2")
    // console.log(e.currentTarget)
    // const applied = localStorage.getItem(e.currentTarget) == "true";
    // e.preventDefault()
    // console.log(localStorage)
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
