document.addEventListener("DOMContentLoaded", function () {
  const bgImage = document.querySelector('.bgimage-change');
  const bgChange = document.querySelector('#bg-change-id');
  let bgImageBack = document.querySelector('.bg-input');

  bgImage.addEventListener('input', function(e){
    let bgImageVal = bgImage.value
    // console.log(bgImageVal)
    if (bgImageVal == "Black"){
      bgChange.setAttribute('class', 'img-bg-black');
      bgImageBack.style.backgroundColor = "Black"
    } else if(bgImageVal == "Grey") {
      bgChange.setAttribute('class', 'img-bg-grey');
      bgImageBack.style.backgroundColor = "Grey"
    } else if(bgImageVal == "White") {
      bgChange.setAttribute('class', 'img-bg-white');
      bgImageBack.style.backgroundColor = "White"
    } else if(bgImageVal == "Red") {
      bgChange.setAttribute('class', 'img-bg-red');
      bgImageBack.style.backgroundColor = "Red"
    } else if(bgImageVal == "Blue") {
      bgChange.setAttribute('class', 'img-bg-blue');
      bgImageBack.style.backgroundColor = "Blue"
    } else if(bgImageVal == "Green") {
      bgChange.setAttribute('class', 'img-bg-green');
      bgImageBack.style.backgroundColor = "Green"
    } else if(bgImageVal == "Yellow") {
      bgChange.setAttribute('class', 'img-bg-yellow');
      bgImageBack.style.backgroundColor = "Yellow"
    } else if(bgImageVal == "Purple") {
      bgChange.setAttribute('class', 'img-bg-purple');
      bgImageBack.style.backgroundColor = "Purple"
    } else if(bgImageVal == "Orange") {
      bgChange.setAttribute('class', 'img-bg-orange');
      bgImageBack.style.backgroundColor = "Orange"
    } else {
      bgChange.setAttribute('class', 'img-bg-change');
    }
  })
})
