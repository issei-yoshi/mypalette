document.addEventListener("DOMContentLoaded", function () {
  let main = document.querySelector('.main-color');
  let sub = document.querySelector('.sub-color');
  let body = document.querySelector('.body-color');
  let button = document.querySelector('.submit-button')

  main.addEventListener("input", ()=> {
    main = "input"
    change();
  })

  sub.addEventListener("input", ()=> {
    sub = "input"
    change();
  })

  body.addEventListener("input", ()=> {
    body = "input"
    change();
  })

  function change(){
    if (main == "input" && sub == "input" && body == "input") {
      button.disabled = false
      button.style.backgroundColor = "#34d399"
      button.style.cursor = "pointer"
      return
    }
  }
})
