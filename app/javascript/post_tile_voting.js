document.addEventListener('click', function(event) {
    const target = event.target;
    if (target.classList.contains('tile-image')) {
        event.preventDefault(); // リンクのデフォルトの挙動をキャンセル
        const tileId = target.dataset.tileId;
        const hasVoted = target.dataset.voted === 'true';

        // すでに投票済みの場合は、投票を削除するリクエストを送信
        if (hasVoted) {
            fetch(`/post_tiles/${tileId}/vote`, {
                method: 'DELETE',
                headers: {
                    'X-CSRF-Token': document.querySelector('[name="csrf-token"]').content,
                    'Accept': 'text/vnd.turbo-stream.html'
                },
                credentials: 'same-origin'
            }).then(response => {
                // 応答を処理する
            });
        } else {
            // 投票を作成するリクエストを送信
            fetch(`/post_tiles/${tileId}/vote`, {
                method: 'POST',
                headers: {
                    'X-CSRF-Token': document.querySelector('[name="csrf-token"]').content,
                    'Accept': 'text/vnd.turbo-stream.html'
                },
                credentials: 'same-origin'
            }).then(response => {
                // 応答を処理する
            });
        }
    }
}, false);

