document.addEventListener("DOMContentLoaded", function () {
  const bgImage = document.querySelector('.bgimage-change');
  const bgChange = document.querySelector('#bg-change-id');
  let bgImageBack = document.querySelector('.bg-input');

  let bgImageVal = bgImage.value
  // console.log(bgImageVal)
  if (bgImageVal == "Black"){
    bgChange.setAttribute('class', 'img-bg-black');
    bgImage.style.backgroundColor = bgImageVal
  } else if(bgImageVal == "Grey") {
    bgChange.setAttribute('class', 'img-bg-grey');
    bgImage.style.backgroundColor = bgImageVal
  } else if(bgImageVal == "White") {
    bgChange.setAttribute('class', 'img-bg-white');
    bgImage.style.backgroundColor = bgImageVal
  } else if(bgImageVal == "Red") {
    bgChange.setAttribute('class', 'img-bg-red');
    bgImage.style.backgroundColor = bgImageVal
  } else if(bgImageVal == "Blue") {
    bgChange.setAttribute('class', 'img-bg-blue');
    bgImage.style.backgroundColor = bgImageVal
  } else if(bgImageVal == "Green") {
    bgChange.setAttribute('class', 'img-bg-green');
    bgImage.style.backgroundColor = bgImageVal
  } else if(bgImageVal == "Yellow") {
    bgChange.setAttribute('class', 'img-bg-yellow');
    bgImage.style.backgroundColor = bgImageVal
  } else if(bgImageVal == "Purple") {
    bgChange.setAttribute('class', 'img-bg-purple');
    bgImage.style.backgroundColor = bgImageVal
  } else if(bgImageVal == "Orange") {
    bgChange.setAttribute('class', 'img-bg-orange');
    bgImage.style.backgroundColor = bgImageVal
  } else {
    bgChange.setAttribute('class', 'img-bg-change');
    bgImage.style.backgroundColor = bgImageVal
  }
})
