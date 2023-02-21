document.addEventListener("DOMContentLoaded", function () {

  const body = document.querySelector('.body-color');
  let bodyChangeEls = document.querySelectorAll('.body-change');
  let bodyChangeElBgs = document.querySelectorAll('.body-change-bg');

  const rhex = 0.299
  const ghex = 0.587
  const bhex = 0.114

  body.addEventListener('input', function(e){
    const colorVal = e.target.value

    bodyChangeEls.forEach(function(el) {
      el.style.color = colorVal
    })

    bodyChangeElBgs.forEach(function(el) {
      el.style.backgroundColor = colorVal

      let rgbVal = colorVal.slice(1);
      const red = rgbVal.substr( 0, 2 );
      const green = rgbVal.substr( 2, 2 );
      const blue = rgbVal.substr( 4, 2 );
      const brightness = Math.floor((parseInt(red, 16) * rhex) + (parseInt(green, 16) * ghex) + (parseInt(blue, 16) * bhex))
      const textColor = brightness >= 140 ? '#000000' : '#FFFFFF'

      el.style.color = textColor;
    })
  });
})
