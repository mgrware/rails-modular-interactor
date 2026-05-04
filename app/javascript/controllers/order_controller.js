import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["item", "quantity", "total"]

  connect() {
    this.calculate()
  }

  calculate() {
    const unitPrice = 100.0 // Simulating fixed price for demo
    const quantity = parseInt(this.quantityTarget.value) || 0
    const total = unitPrice * quantity
    
    this.totalTarget.textContent = new Intl.NumberFormat('id-ID', {
      style: 'currency',
      currency: 'IDR'
    }).format(total)
  }
}
