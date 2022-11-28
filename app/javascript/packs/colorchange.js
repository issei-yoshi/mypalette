document.addEventListener("DOMContentLoaded", function () {
  function clickColor(){
    console.log('hello');
  }

  const main = document.querySelector('#main-color');

  main.addEventListener('click', clickColor);
})
