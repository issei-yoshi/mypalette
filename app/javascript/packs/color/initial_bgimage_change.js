document.addEventListener("DOMContentLoaded", function () {
  const bgImage = document.querySelector('.bgimage-change');
  const bgChange = document.querySelector('#bg-change-id');
  let bgImageBack = document.querySelector('.bg-input');

  let bgImageVal = bgImage.value
  let classColorName = bgImageVal.slice( 0, 1 ).toLowerCase() + bgImageVal.slice(1);
  bgChange.setAttribute('class', `img-bg-${classColorName}`)
  bgImageBack.style.backgroundColor = bgImageVal
})
