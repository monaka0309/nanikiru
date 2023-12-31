# [なにきる 〜麻雀何切る相談アプリ〜]

## サービス概要

みなさんは麻雀をやっていて何を切っていいか分からない時はありませんか？
　[なにきる]ではその悩みを解決します。
　困った状況を写真に収め、投稿し、閲覧者から投票やコメントなどの反応をもらう投稿型（CGM）サービスです。

##　想定されるユーザー層
　対象者は全ての麻雀プレイヤー。
　年代問わず麻雀をやっていて、自力で解決できなかった経験がある人。
　または、困っている人を助けたいという思いがある人。

## サービスコンセプト

- ユーザーが抱えている課題感と提供するサービスでどのように解決するのか
  => 麻雀中になにを切っていいか分からないことがあると思います。
  　投稿者が盤面を写真で投稿し切ったら良いと思う牌の選択肢を挙げてもらいます。
  　それに対して閲覧者が投票をし、投稿者がどの牌を切ったらいいのかを学びます。
  　必要に応じてコメントを送り、具体的な意見交換を行うことができます。
  　また、X 等で共有の際は盤面の写真と投票数の多い牌を表示し、興味を持ってもらい、利用者を増やしていきます。

- なぜそのサービスを作ろうと思ったのか
  => 私は麻雀が弱いです。雀魂（オンライン麻雀アプリ）で全然勝てません。対戦中にも何の牌を切ったらいいか分からないことがよくありました。その時、盤面のスクリーンショットを友達に送り相談していました。もし、同じように困ってる人が[なにきる]を使えば、私と同じように利用者同士で意見しあい、互いに強くなっていけると考えました。

- どのようなサービスにしていきたいか
  => 利用者同士で気軽に意見しあい、お互いの知識を分け合えるようなサービスにしたい。

- どこが売りになるか、差別化ポイントになるか
  => 麻雀で何切る問題はよく見かけます。また、自分で牌を選んで何切る問題を作るサービスも存在します。
  　しかし、捨て牌を見ることができなかったり、通知機能がついていないことが多いです。
  　私のサービスでは写真を投稿してもらうことで、捨て牌やその時の点数を見ることができたり、上手い人の攻め方を知ることができます。また、通知機能により忘れることがなかったり、積極的に利用者同士での意見交換ができます。

## 実装を予定している機能

### MVP

- 会員登録
- ログイン機能
- 新規投稿・投稿一覧・詳細・編集・削除
  ：画像とコメント、切りたい牌の選択肢を載せて投稿。
- 画像加工・合成（gem carrierwave、mini_magick）
- 投票機能(Javascript, Jquery)
  ：投稿者があげた選択肢に投票をしてもらい、投票数が投稿に映るようにする。
- コメント機能
- プロフィール機能
  ：名前、好きな役、過去の投稿一覧
- 通知機能（WebSocket）
  ：投票時、コメント時に投稿者に通知が行きます。
  また、毎日１９時に「困っている人を助けてあげよう！」と通知がいくようにします。
- SNS への共有機能(Open Graph Protocol)
  ：共有時に ① 投稿した盤面の写真と ② 投票が 1 番多い牌を載せて共有できるようにします。

### その後の機能

- スマホ画面対応(PWA)
- ユーザー検索機能(Ransack)
- LINE API（ログイン、通知）
- いいね機能

### 余裕があれば取り入れたいこと。

- 画像認識機能(Google Cloud Vision API )
  ：画像を AI に読み込んで学習してもらい、① 自動で手配の選択肢を上げてもらったり、② 考えられる役の提案、③ リーチまでのシャンテン数を教えてくれる機能をつけたい。

##　画面遷移図
https://www.figma.com/file/YZ1g8ymXLKuTq0ZoXSynyP/nanikiru?type=design&node-id=0%3A1&mode=design&t=i7oimFWpTcESIH1i-1
