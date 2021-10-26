import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"
import * as url from "url";

export default class extends Controller {

  connect() {
    console.log("Conectado")
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
    let id = event.target.dataset.id
    if (admin.checked) {
      var url = `/devise/registrations/isAdmin?user=${id}&admin=true`;
      console.log(url)
    } else {
      var url = `/devise/registrations/isAdmin?user=${id}&admin=false`;
      console.log(url)
    }
    fetch(url);
  }

}
