// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "./sidebar_toggle"
import "./image_preview"

document.addEventListener('DOMContentLoaded', function() {
    const modal = document.getElementById('tile-modal');
    const openModalButton = document.getElementById('open-modal');

    openModalButton.addEventListener('click', function() {
      modal.style.display = 'block';
    });

    const tileImages = document.querySelectorAll('.tile-image');
    tileImages.forEach(function(tileImage) {
      tileImage.addEventListener('click', function() {
        const selectedImagePath = tileImage.dataset.path;
        // ここで選択された画像を処理（例: フォームにパスを設定）
        modal.style.display = 'none';
      });
    });
  });
import "./modal"
import "./post_tile_voting"
import Rails from "@rails/ujs";
Rails.start();
