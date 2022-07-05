import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dropdown"
export default class extends Controller {

  static targets = ["dropdown"]

  connect() {
    console.log("Test")
  }
  openDropdown(e) {
    e.preventDefault()
    console.log(this.dropdownTarget)
    this.dropdownTarget.classList.remove("display-none")
    this.dropdownTarget.classList.add("display")
    this.dropdownTarget.classList.remove("display")



  }
}

