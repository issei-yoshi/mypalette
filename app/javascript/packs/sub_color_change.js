document.addEventListener("DOMContentLoaded", function () {

  const sub = document.querySelector('.sub-color');
  let subChangeEls = document.querySelectorAll('.sub-change');
  let subChangeElBgs = document.querySelectorAll('.sub-change-bg');

  sub.addEventListener('input', function(e){
    const colorVal = e.target.value

    subChangeEls.forEach(function(el) {
      el.style.color = colorVal
    })

    subChangeElBgs.forEach(function(el) {
      el.style.backgroundColor = colorVal

      let rgbVal = colorVal.slice(1);
      const red = rgbVal.substr( 0, 2 );
      const green = rgbVal.substr( 2, 2 );
      const blue = rgbVal.substr( 4, 2 );
      const brightness = Math.floor((parseInt(red, 16) * 0.299) + (parseInt(green, 16) * 0.587) + (parseInt(blue, 16) * 0.114))
      const textColor = brightness >= 140 ? '#000000' : '#FFFFFF'

      el.style.color = textColor;
    })
  });
})
