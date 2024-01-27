document.addEventListener("DOMContentLoaded", function() {
    var sidebar = document.getElementById("sidebar");
    var sidebarToggle = document.getElementById("sidebarToggle");
  
    if (sidebar && sidebarToggle) {
      sidebarToggle.addEventListener("click", function() {
        sidebar.classList.toggle("-translate-x-full");
      });
    }
  });
  