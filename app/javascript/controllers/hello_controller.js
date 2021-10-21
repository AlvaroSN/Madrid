import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"
import * as url from "url";

export default class extends Controller {

  connect() {
    console.log("Conectado");
  }

  prueba(event) {
    let pos = event.target.parentElement.dataset.pos
    console.log(pos)
    let jugador = event.target.selectedOptions[0].value
    let dir = `/players/teamSelected?player=${jugador}&pos=${pos}`
    console.log(dir)
    Turbo.visit(dir, {action:"replace"})
  }

  check(event){

    const admin = event.target
    if (admin.checked) {
      console.log("Marcado")
      var url = `/devise/registrations/isAdmin?admin=true`;
    } else {
      console.log("Desmarcado")
      var url = `/devise/registrations/isAdmin?admin=false`;
    }

  }

  hide(event) {

  }

}
