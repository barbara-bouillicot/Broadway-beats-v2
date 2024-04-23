import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ['modal', 'title', 'songIdInput'];

  connect() {
    console.log("hello from modal controller")
  }

  showModal(event) {
    const button = event.currentTarget;

    const title = button.dataset.trackTitle;
    const songId = button.dataset.trackId;

    this.titleTarget.textContent = title;
    this.songIdInputTarget.value = songId;
  }

}
