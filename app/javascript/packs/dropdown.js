document.addEventListener("DOMContentLoaded", function () {
  const dropdownBtn = document.getElementById("dropbtn");
  const dropdownMenu = document.getElementById("dropdown");
  const toggleArrow = document.getElementById("droparrow");

  const toggleDropdown = function () {
    dropdownMenu.classList.toggle("show");
    toggleArrow.classList.toggle("arrow");
  };

  dropdownBtn.addEventListener("click", function (e) {
    e.stopPropagation();
    toggleDropdown();
  });

  document.documentElement.addEventListener("click", function () {
    if (dropdownMenu.classList.contains("show")) {
      toggleDropdown();
    }
  });
})
