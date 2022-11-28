document.addEventListener("DOMContentLoaded", function () {
  function clickColor(){
    console.log('hello');
  }

  const main = document.querySelector('#main-color');
  // let mainVal = document.querySelector('#main-color').value;

  main.addEventListener('input', function(e){
    // mainVal = e.target.value
    // console.log(mainVal);
  });
})
