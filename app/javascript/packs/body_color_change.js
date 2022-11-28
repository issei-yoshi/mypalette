document.addEventListener("DOMContentLoaded", function () {

  const body = document.querySelector('.body-color');
  let bodyChangeEls = document.querySelectorAll('.body-change');
  let bodyChangeElBgs = document.querySelectorAll('.body-change-bg');

  body.addEventListener('input', function(e){
    const colorVal = e.target.value
    bodyChangeEls.forEach(function(el) {
      el.style.color = colorVal
    })
    bodyChangeElBgs.forEach(function(el) {
      el.style.backgroundColor = colorVal
    })
  });
})
