import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"

// Connects to data-controller="drag"
export default class extends Controller {
  connect() {

    this.sortable = Sortable.create(this.element, {
      onEnd: this.end.bind(this)
    })
  }
  end(event) {
    let id = event.item.dataset.id
    console.log(id)
    console.log(this.data.get("url"))

    let data = new FormData()
    data.append("position", event.newIndex + 1 )

    // Rails.ajax({
    //   url: this.data.get("url").replace(":id", id),
    //   type: "PATCH", 
    //   data: data
    // })


    fetch(this.data.get("url").replace(":id", id), {
      method: "PATCH",
      body: data, 
      headers: {
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
      }
    })
      .then(response => {
        // Gérer la réponse si nécessaire
      })
      .catch(error => {
        // Gérer les erreurs si nécessaire
      })
  }
}
