import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {

  }

  prueba(event) {

    let evento = event.target
    let pos = evento.parentElement.dataset.pos
    let jugador = evento.selectedOptions[0].value
    let dir = `/players/teamSelected?player=${jugador}&pos=${pos}`
    console.log(dir)
    Turbo.visit(dir, {action:"replace"})
    document.addEventListener("turbo:frame-render", function(){secondRender()})

    let x = document.getElementsByClassName("defense")
    console.log(x)
    let selec = ""
    let posSelec = ""
    let urlRepetida = ""
    let previos = []
    for (let i=0; i<x.length; i++) {
      selec = x[i].children[0].value
      //if (x[i].children[0] !== event.target)
      if (previos.includes(selec)) {
        posSelec = x[i].dataset.pos
        console.log(posSelec)
        urlRepetida = `/players/teamSelected?player=${event.target.parentElement.dataset.name}&pos=${posSelec}`

        //Actualización variables
        evento.parentElement.dataset.name = jugador
        //Cambiar select y nombre del jugador cambiado

        function secondRender (){
          console.log('Entró al Listener')
          Turbo.visit(urlRepetida, {action:"replace"})
        }

      } else {
        previos.push(selec)
      }
    }
    console.log(previos)

    console.log(event.target.parentElement.dataset.name)
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
