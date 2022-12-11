document.addEventListener("DOMContentLoaded", function () {
  const bgImageBacks = document.querySelectorAll('.bg-input-n');
  bgImageBacks.forEach(function(val){
    value = val.value
    val.style.backgroundColor = value
  });
})
