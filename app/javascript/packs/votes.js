document.addEventListener("turbolinks:load", () => {
    document.querySelectorAll(".vote-button").forEach((button) => {
      button.addEventListener("ajax:success", (event) => {
        const [data, status, xhr] = event.detail;
        const tileElement = document.querySelector(`.tile[data-tile-id="${data.tile_id}"]`);
        tileElement.querySelector(".votes-count").textContent = data.votes_count;
      });
    });
  });
  