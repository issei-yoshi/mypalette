document.addEventListener("DOMContentLoaded", function () {
  const bgImage = document.querySelector('.bgimage-change');
  const bgChange = document.querySelector('#bg-change-id');

  bgImage.addEventListener('input', function(e){
    let bgImageVal = bgImage.value
    // console.log(bgImageVal)
    if (bgImageVal == "Black"){
      bgChange.setAttribute('class', 'img-bg-black');
    } else if(bgImageVal == "Grey") {
      bgChange.setAttribute('class', 'img-bg-grey');
    } else if(bgImageVal == "White") {
      bgChange.setAttribute('class', 'img-bg-white');
    } else if(bgImageVal == "Red") {
      bgChange.setAttribute('class', 'img-bg-red');
    } else if(bgImageVal == "Blue") {
      bgChange.setAttribute('class', 'img-bg-blue');
    } else if(bgImageVal == "Green") {
      bgChange.setAttribute('class', 'img-bg-green');
    } else if(bgImageVal == "Yellow") {
      bgChange.setAttribute('class', 'img-bg-yellow');
    } else if(bgImageVal == "Purple") {
      bgChange.setAttribute('class', 'img-bg-purple');
    } else if(bgImageVal == "Orange") {
      bgChange.setAttribute('class', 'img-bg-orange');
    } else {
      bgChange.setAttribute('class', 'img-bg-change');
    }
  })
})
