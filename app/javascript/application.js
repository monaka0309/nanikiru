// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "./sidebar_toggle"
import "./image_preview"
import "./modal"
import "./post_tile_voting"
import Rails from "@rails/ujs";
Rails.start();
