import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'label', 'input' ]

  connect() {
    console.log("range controller connected");
    this.setLabel()
  }

  update(e) {
    this.setLabel()
  }

  setLabel() {
    this.labelTarget.textContent = '$ ' + this.inputTarget.value + '.00'
  }
}