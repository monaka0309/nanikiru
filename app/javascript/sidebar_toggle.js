document.addEventListener("turbo:load", function() {
    const sidebar = document.getElementById("sidebar");
    const sidebarToggle = document.getElementById("sidebarToggle");
  
    if (sidebar && sidebarToggle) {
      sidebarToggle.addEventListener("click", function() {
        sidebar.classList.toggle("-translate-x-full");
      });
    }
  });
  