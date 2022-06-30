import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "reviewform" ]

  connect() {
    console.log("Hello Stimulus!")
  }

  show() {
    this.reviewformTarget.classList.toggle("d-none")
  }
}
