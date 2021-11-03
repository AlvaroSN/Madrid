import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {

  }

  prueba(event) {

    let evento = event.target
    let pos = evento.parentElement.dataset.pos
    let jugador = evento.selectedOptions[0].value
    let dir = `/players/teamSelected?player=${jugador}&pos=${pos}`
    console.log("Ruta cambio: " + dir)

    let x = document.getElementsByClassName(evento.parentElement.dataset.class)
    //console.log(x)
    let selec = ""
    let previos = []

    for (let i=0; i<x.length; i++) {
      selec = x[i].children[0].value

      if (previos.includes(selec)) {
        let posSelec = x[i].dataset.pos
        let cambio = event.target.parentElement.dataset.name
        let urlRepetida = `/players/teamSelected?player=${cambio}&pos=${posSelec}`
        console.log("Ruta sustitución:" + urlRepetida)

        let secondVisit = function () {
          document.removeEventListener("turbo:visit", secondVisit)
          setTimeout(function (){ Turbo.visit(urlRepetida, {action:"replace"}) }, 100)
        };
        document.addEventListener("turbo:visit", secondVisit)

        //Actualización variables
        evento.parentElement.dataset.name = jugador
        document.getElementById(x[i].dataset.select).value=cambio
        x[i].dataset.name = cambio

      } else {
        previos.push(selec)
        x[i].dataset.name = evento.parentElement.dataset.name
      }
    }

    console.log("El data-name de la posición actual es: " + evento.parentElement.dataset.name)
    console.log(" ")
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
