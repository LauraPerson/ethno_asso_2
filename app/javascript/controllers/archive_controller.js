import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dropdown"
export default class extends Controller {

  static targets = ["dropdown", "button"]

  connect() {
    console.log("Test")
  }
  openArchive(e) {
    e.preventDefault()
    console.log(this.buttonTarget.innerHtml)
    if (this.dropdownTarget.className == "dropdown-archive display-none") {
      this.dropdownTarget.classList.remove("display-none")
      this.dropdownTarget.classList.add("display")
      this.buttonTarget.innerText= "Cacher les projets archivés"
      this.scrollTo({
        top: 500,
        behavior: 'smooth'
      });
    } else {
      this.dropdownTarget.classList.remove("display")
      this.buttonTarget.innerText= "Voir les projets archivés?"
      this.dropdownTarget.classList.add("display-none")
    }
  }
}

