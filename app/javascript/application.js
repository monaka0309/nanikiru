// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "./sidebar_toggle"
import "./image_preview"

document.addEventListener('DOMContentLoaded', function() {
    var modal = document.getElementById('tile-modal');
    var openModalButton = document.getElementById('open-modal');

    openModalButton.addEventListener('click', function() {
      modal.style.display = 'block';
    });

    var tileImages = document.querySelectorAll('.tile-image');
    tileImages.forEach(function(tileImage) {
      tileImage.addEventListener('click', function() {
        var selectedImagePath = tileImage.dataset.path;
        // ここで選択された画像を処理（例: フォームにパスを設定）
        modal.style.display = 'none';
      });
    });
  });
import "./modal"
import Rails from "@rails/ujs";
Rails.start();
