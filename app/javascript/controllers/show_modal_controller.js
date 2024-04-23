import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="show-modal"
export default class extends Controller {
  static targets = ['title', 'content', 'button'];

  connect() {
    console.log("hello from show_modal_controller")
  }

  open(event) {
    const button = event.currentTarget;
    console.log(button)
    const title = button.dataset.showTitle;

    const description = button.dataset.showContent;
    console.log(description)

    this.titleTarget.textContent = title;
    this.contentTarget.textContent = description;

  }

}
