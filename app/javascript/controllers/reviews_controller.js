import { Controller } from "@hotwired/stimulus"
import { csrfToken } from "@rails/ujs"

export default class extends Controller {
  static targets = ["review", "form"]

  connect() {
    console.log(this.element)
    console.log(this.reviewTarget)
    console.log(this.formTarget)
  }

  send(e) {
    e.preventDefault()
    console.log("TODO: send request in AJAX")
    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json", "X-CSRF-Token": csrfToken() },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
        if (data.inserted_item) {
          this.reviewTarget.insertAdjacentHTML("afterbegin", data.inserted_item)
        }
        // this.formTarget.outerHTML = form
      })
  }
}
