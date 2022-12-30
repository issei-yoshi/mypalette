document.addEventListener("DOMContentLoaded", function (e) {

  const bg = document.querySelector('.bg-color');
  let bgChangeEls = document.querySelectorAll('.bg-change');
  let bgChangeElBgs = document.querySelectorAll('.bg-change-bg');
  const colorVal = bg.value

 bgChangeEls.forEach(function(el) {
    el.style.color = colorVal
  })

 bgChangeElBgs.forEach(function(el) {
    el.style.backgroundColor = colorVal
    let rgbVal = colorVal.slice(1);
    const red = rgbVal.substr( 0, 2 );
    const green = rgbVal.substr( 2, 2 );
    const blue = rgbVal.substr( 4, 2 );
    const brightness = Math.floor((parseInt(red, 16) * 0.299) + (parseInt(green, 16) * 0.587) + (parseInt(blue, 16) * 0.114))
    const textColor = brightness >= 140 ? '#000000' : '#FFFFFF'
    el.style.color = textColor;
  })
})
