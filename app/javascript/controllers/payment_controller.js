import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["selection", "check", "cc", "po"]

    connect() {
        this.showAdditionalFields()
    }

    showAdditionalFields() {
        const type = this.selectionTarget.value

        this.hideAll()

        if (type === "Check") {
            this.checkTarget.classList.remove("hidden")
        } else if (type === "Credit card") {
            this.ccTarget.classList.remove("hidden")
        } else if (type === "Purchase order") {
            this.poTarget.classList.remove("hidden")
        }
    }

    hideAll() {
        this.checkTarget.classList.add("hidden")
        this.ccTarget.classList.add("hidden")
        this.poTarget.classList.add("hidden")
    }
}