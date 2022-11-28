document.addEventListener("DOMContentLoaded", function () {
  function clickColor(){
    console.log('hello');
  }

  const main = document.querySelector('#main-color');
  let mainChangeEls = document.querySelectorAll('.main-change');

  main.addEventListener('input', function(e){
    const colorVal = e.target.value
    mainChangeEls.forEach(function(el) {
      el.style.color = colorVal
    })
  });
})
