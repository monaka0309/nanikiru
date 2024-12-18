# なにきる 〜麻雀何切る相談アプリ〜<br>

~サイトリンク https://www.nanikiru-mahjong.com~
（2024年7月でサービスを停止しました。）

<br>
<a href="https://gyazo.com/f36d7b50e4e693367f3ba7fe6a3c8320"><img src="https://i.gyazo.com/f36d7b50e4e693367f3ba7fe6a3c8320.png" alt="Image from Gyazo" width="390"/></a>

## サービス概要
みなさんは麻雀をやっていて何を切っていいか分からない時はありませんか？<br>
[なにきる]ではその悩みを解決します。<br>
困った状況を写真に収め、投稿し、閲覧者から投票やコメントなどの反応をもらう投稿型（CGM）サービスです。<br>
リアルタイムで相談するのは難しいですが、後から[なにきる]に投稿することであなたのモヤモヤを解決します。<br>
<br>

## 想定されるユーザー層 　
対象者は全ての麻雀プレイヤー。<br>
年代問わず麻雀をやっていて、自力で解決できなかった経験がある人。または、困っている人を助けたいという思いがある人。<br>
<br>

## サービスコンセプト
麻雀中になにを切っていいか分からないことがあると思います。<br>
1. 投稿者が盤面を写真で投稿し切ったら良いと思う牌の選択肢を挙げてもらいます。 　<br>
2. それに対して閲覧者が投票をし、投稿者がどの牌を切ったらいいのかを学びます。 　<br>
3. 必要に応じてコメントを送り、具体的な意見交換を行うことができます。 　<br>
4. X 等で共有の際は盤面の写真と投票数の多い牌を表示し、興味を持ってもらい、利用者を増やしていきます。<br>

## なぜそのサービスを作ろうと思ったのか
私は麻雀が弱いです。雀魂（オンライン麻雀アプリ）で全然勝てません。<br>
対戦中にも何の牌を切ったらいいか分からないことがよくありました。<br>
その時、盤面のスクリーンショットを友達に送り相談していました。<br>
もし、同じように困ってる人が[なにきる]を使えば、私と同じように利用者同士で意見しあい、互いに強くなっていけると考えました。<br>
<br>

## どのようなサービスにしていきたいか
利用者同士で気軽に意見しあい、お互いの知識を分け合えるようなサービスにしたい。<br>
<br>

## どこが売りになるか、差別化ポイントになるか
麻雀で何切る問題はよく見かけます。また、自分で牌を選んで何切る問題を作るサービスも存在します。 　<br>
しかし、捨て牌を見ることができなかったり、通知機能がついていないことが多いです。 　<br>
私のサービスでは写真を投稿してもらうことで、捨て牌やその時の点数を見ることができたり、上手い人の攻め方を知ることができます。<br>
また、通知機能により忘れることがなかったり、積極的に利用者同士での意見交換ができます。<br>
<br>

## 機能一覧

・会員登録<br>
・ログイン機能<br>
・新規投稿・投稿一覧・詳細・編集・削除 ：画像とコメント、切りたい牌の選択肢を載せて投稿。<br>
・画像加工（gem carrierwave、mini_magick）<br>
・投票機能(Turbo-rails) ：投稿者があげた選択肢に投票をしてもらい、投票数が投稿に映るようにする。<br>
・コメント機能<br>
・プロフィール機能 ：名前、プロフィール画像、過去の投稿一覧<br>
・SNS への共有機能(動的OGP) ：共有時に投稿した盤面の写真を載せて共有できるようにします。<br>
・ユーザー検索機能<br>
・LINEアカウントでのログイン機能<br>
・いいね機能<br>
・並び替え機能<br>
<br>

|投稿一覧画面|
|----|
|<a href="https://gyazo.com/2b49bbe5c1f8893a7141ca3b00ce2cb5"><img src="https://i.gyazo.com/2b49bbe5c1f8893a7141ca3b00ce2cb5.gif" alt="Image from Gyazo" width="1000"/></a>|

|ユーザー登録画面|ログイン画面|
|----|----|
|<a href="https://gyazo.com/305c8b3cff9c5060a6f24e4bf055edc5"><img src="https://i.gyazo.com/305c8b3cff9c5060a6f24e4bf055edc5.png" alt="Image from Gyazo" width="1440"/></a>|<a href="https://gyazo.com/e423307ec3e8fb374500b650512cae61"><img src="https://i.gyazo.com/e423307ec3e8fb374500b650512cae61.png" alt="Image from Gyazo" width="1417"/></a>|

|新規投稿画面|コメント画面|
|----|----|
|<a href="https://gyazo.com/0799ed210aec43c70476b1fa38386135"><img src="https://i.gyazo.com/0799ed210aec43c70476b1fa38386135.png" alt="Image from Gyazo" width="1440"/></a>|<a href="https://gyazo.com/9435cc946ec74301448856e0a952b992"><img src="https://i.gyazo.com/9435cc946ec74301448856e0a952b992.png" alt="Image from Gyazo" width="1440"/></a>|

|並び替え・いいね機能|ユーザー検索画面|
|----|----|
|<a href="https://gyazo.com/27e100c562629b22e306f3dd7e6cf5fc"><img src="https://i.gyazo.com/27e100c562629b22e306f3dd7e6cf5fc.png" alt="Image from Gyazo" width="1417"/></a>|<a href="https://gyazo.com/1fdafa4e0903a60ac02754db3b97bf5f"><img src="https://i.gyazo.com/1fdafa4e0903a60ac02754db3b97bf5f.png" alt="Image from Gyazo" width="1416"/></a>|

|動的OGP画面|プロフィール画面|
|----|----|
|<a href="https://gyazo.com/7564ac768831c99ff8c822d59acf9b23"><img src="https://i.gyazo.com/7564ac768831c99ff8c822d59acf9b23.png" alt="Image from Gyazo" width="1428"/></a>|<a href="https://gyazo.com/324b4fbde800e594f516b49e84fbe4aa"><img src="https://i.gyazo.com/324b4fbde800e594f516b49e84fbe4aa.png" alt="Image from Gyazo" width="1414"/></a>|

## 技術選定
|フロントエンド|CSS フレームワーク|
|----|----|
|JavaScript|Tailwind css, daisyUI|

|バックエンド|認証・認可|
|----|----|
|Ruby on Rails 7.0.8|Sorcery|
|Ruby 3.2.2|

|RDS|デプロイ|
|----|----|
|PostgreSQL|heroku|

|バージョン管理|Infrastructure|
|----|----|
|GitHub|AWS|

## 構成図
<a href="https://gyazo.com/c96b8c8b845b4dc6a3b5023449d2793e"><img src="https://i.gyazo.com/c96b8c8b845b4dc6a3b5023449d2793e.png" alt="Image from Gyazo" width="1395"/></a>
<br>

## ER図
<a href="https://gyazo.com/cd1bf8527a9eeb955bd606da741572ed"><img src="https://i.gyazo.com/cd1bf8527a9eeb955bd606da741572ed.png" alt="Image from Gyazo" width="1115"/></a>
<br>

## 画面遷移図
https://www.figma.com/file/YZ1g8ymXLKuTq0ZoXSynyP/nanikiru?type=design&node-id=0%3A1&mode=design&t=i7oimFWpTcESIH1i-1
