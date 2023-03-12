import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  close() {
    const noticeDiv = document.getElementById('notice-div');
    noticeDiv.classList.add('hidden');
  }
}
