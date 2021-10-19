# Untangled_pasta_trees

## サービス概要
### ３行で
情報の全体像が把握できず体系的な理解ができない人へ
視覚的に理解しやすくより深い理解を手助けする
情報整理サービスUntangled_pasta_treesです。
### メインのターゲットユーザー
情報の全体像がつかめない初学者
### ユーザーが抱える課題
今までの文字主体の情報サービスではその情報をイメージに変換しにくく、また文章自体が硬い表現で読みやすさに欠けているものが多かった。
初学者にとってそういったサイトで理解を深めることは難しく、学習に挫折してしまうユーザーも少なくなかった。
### 解決方法
ツリー構造やマインドマップなどの視覚的にわかりやすいレイアウトを取り入れることで文章だけではイメージしづらかった全体像を理解しやすいサービスを作る。
また文章自体も読みやすく理解しやすい表現を徹底し、読むことに対する心的負荷や理解に必要なハードルをさげる。
### プロダクト
ツリー構造やマインドマップなどを用いたwebサービス
### 実装予定の機能
* 簡単にツリー構造やマインドマップなどの図を作成する機能
* 作成した図をマークダウン等に簡単に貼り付けられる機能
* サイト内の公開されている情報を検索できる検索窓

### 上記の機能が実装できた場合に追加したい機能
* ユーザーが興味のあるジャンルで情報解説ページを作成する機能
* Ruby on Railsの１次情報を噛み砕いた解説ページ
* マークダウン等に貼り付けた図をajaxで編集、詳細情報を見る機能
 
### なぜこのサービスを作りたいのか？
自分が何か新しいジャンルに触れる時に大事にしているのが根本的な理解、体系的に情報を整理することです。
表面的な理解では難しい問題に対処できないことが多いですし、体系的に理解できていなければ情報に応用性を持たせることが難しいです。
自分はもともと数学の公式や英語の文法などにたびたび引っ掛かりを覚えることがありました。
「こういう公式があります、こう使ってください。」と説明されるたびに、なぜそうなるのか、なぜ原理についての解説がないのかと考えてしまいます。
テレビを買ったユーザーにテレビの仕組みを教える店員はいないですし、考える必要のない部分をブラックボックスとして受け入れることは効率的だと思います。
しかし、自分にはそういった根幹についての興味があり、それを深掘りしていくことで応用できることがたくさん増えました。
プログラマーとしてサービスを提供する側になる為に、自分の使う言語やフレームワークを深く理解していることは重要なことです。
今現在、自分は公式のドキュメントやリファレンスを読んでそれについて深く理解できているとは思いません。
しかし、１次情報を自分で読み解いてそれを実装する力は必ず必要になると思います。
そのため、このギャップを埋めることができる機能をもったサービスを作ろうと考えました。

### 画面遷移図
https://www.figma.com/file/KOm82REfxHqtryGavj3zXI/Untangled_pasta_trees?node-id=0%3A1

### 簡易版 how to use
http://localhost:3000/layersでアクセスできます。
* ツリーの一番上にあるのtreetopだけが絶対座表で保存されます。ツリーをドラッグした場合はtreetopをクリックして出た吹き出しの下にあるセーブボタンを押すとtitle,body,x座表,y座標が保存されます。
* その他のleaf要素は全て相対座標です。個別に動かしたい場合はx,y座標を手打ちで入力してsaveしてください。
* 一度セーブして画面をリロードした後、吹き出しにマウスを乗せるとbodyが拡大されます。
* 画面左側の要素が画面外に出る時はツリー全体を右にドラッグしてください。
* delボタン、right,leftは未実装です。