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
    })
  });
})
