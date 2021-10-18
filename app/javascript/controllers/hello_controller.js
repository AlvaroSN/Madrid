import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

export default class extends Controller {

  connect() {
    console.log("Conectado");
  }

  prueba(event) {
    let jugador = event.target.selectedOptions[0].value
    console.log(jugador);
    let url = `/players/team?player=${jugador}`
    console.log(url);
    get(url)
  }

}
