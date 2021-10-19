import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"
import * as url from "url";

export default class extends Controller {

  connect() {
    console.log("Conectado");
  }

  prueba(event) {
    let jugador = event.target.selectedOptions[0].value
    let dir = `/players/teamSelected?player=${jugador}`
    console.log(dir)
    Turbo.visit(dir, {action:"replace"})
  }

}
