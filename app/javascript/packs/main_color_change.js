document.addEventListener("DOMContentLoaded", function () {

  const main = document.querySelector('#main-color');
  let mainChangeEls = document.querySelectorAll('.main-change');
  let mainChangeElBgs = document.querySelectorAll('.main-change-bg');

  main.addEventListener('input', function(e){
    const colorVal = e.target.value
    mainChangeEls.forEach(function(el) {
      el.style.color = colorVal
    })
    mainChangeElBgs.forEach(function(el) {
      el.style.backgroundColor = colorVal
    })
  });
})
