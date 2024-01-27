document.addEventListener("turbo:load", function() {
    const openModalButton = document.getElementById("openModal");
    const closeModalButton = document.getElementById("closeModal");
    const modal = document.getElementById("modal");

    if (openModalButton) {
        openModalButton.addEventListener("click", function() {
            modal.classList.remove("hidden");
        });
    }

    if (closeModalButton) {
        closeModalButton.addEventListener("click", function() {
            modal.classList.add("hidden");
        });
    }
});

