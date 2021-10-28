import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"
import * as url from "url";

export default class extends Controller {

  connect() {

  }

  prueba(event) {
    let pos = event.target.parentElement.dataset.pos
    console.log(pos)
    let jugador = event.target.selectedOptions[0].value
    let previos = document.getElementsByClassName("defense")
    console.log(previos)
    for (let i=0; i<previos.length; i++){
      console.log(previos[i].children[0]);
    }
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

  check2(event){
    const del = event.target
    let id = event.target.dataset.id
    if (del.checked) {
      var url = `/devise/registrations/isDel?user=${id}&del=true`;
      console.log(url)
    } else {
      var url = `/devise/registrations/isDel?user=${id}&del=false`;
      console.log(url)
    }
    fetch(url);
  }

}
