import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="music-player"
export default class extends Controller {
  static targets = ["player", "playButtons", "divTrackPlaying", "imagePlaylist"]

  connect() {
    console.log("hello from music player controller")
    console.log(this.playerTarget)
    console.log(this.playButtonsTargets)
    console.log(this.divTrackPlayingTarget)
  }

  play(event) {
    const trackId = event.currentTarget.dataset.albumTrackId;
    const trackName = event.currentTarget.dataset.trackNameId;
    const imageUrl = document.querySelector(".show-album-img img").src;

    this.playerTarget.classList.remove("d-none");
    this.divTrackPlayingTarget.innerHTML = "";

    const trackNameElement = document.createElement("p");
    trackNameElement.textContent = `${trackName}`;
    trackNameElement.dataset.albumTrackId = `${trackId}`;
    trackNameElement.classList.add("track-title-player");

    const imageElement = document.createElement("img");
    imageElement.src = imageUrl;
    imageElement.alt = `Album Cover for ${trackName}`;
    imageElement.classList.add("avatar-square");

    this.divTrackPlayingTarget.appendChild(imageElement);
    this.divTrackPlayingTarget.appendChild(trackNameElement);
  }

  playlist(event) {
    const trackId = event.currentTarget.dataset.albumTrackId;
    const trackName = event.currentTarget.dataset.trackNameId;
    const imageUrl = event.currentTarget.dataset.trackUrlId;

    this.playerTarget.classList.remove("d-none");
    this.divTrackPlayingTarget.innerHTML = "";

    const trackNameElement = document.createElement("p");
    trackNameElement.textContent = `${trackName}`;
    trackNameElement.dataset.albumTrackId = `${trackId}`;
    trackNameElement.classList.add("track-title-player");

    const imageElement = document.createElement("img");
    imageElement.src = imageUrl;
    imageElement.alt = `Album Cover for ${trackName}`;
    imageElement.classList.add("avatar-square");

    this.divTrackPlayingTarget.appendChild(imageElement);
    this.divTrackPlayingTarget.appendChild(trackNameElement);
  }
}
