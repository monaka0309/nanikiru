document.addEventListener("turbo:load", () => {
    document.getElementById('image-input').addEventListener('change', (event) => {
        const file = event.target.files[0];
        const imagePreview = document.getElementById('image-preview');

        if (file) {
            const reader = new FileReader();

            reader.onload = (e) => {
                imagePreview.innerHTML = `<img src="${e.target.result}" class="max-w-full h-auto" />`;
            };

            reader.readAsDataURL(file);
        }
    });
});
