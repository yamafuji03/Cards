
# アプリの紹介
このアプリは初めて作ったアプリで、ビジネスとプライベートのページを用意し、それぞれのページに自分の連絡先をあらかじめ登録しておき、相手によって渡す情報を変えられる自己紹介アプリです。

https://play.google.com/store/apps/details?id=com.Cards


## このアプリの作成経緯・動機
このアプリは初めて作ったアプリで、初対面の人と連絡先を交換する際に何の情報を渡すべきか困ることがありました。これは情報を渡す相手先によっても渡す情報は変わってくると思います。

そこから着想して、ビジネスとプライベートのページをそれぞれ用意し、それぞれのページに自分の連絡先を登録しておき、相手によって渡す情報を変えられる自己紹介アプリを作成しようと思いました。



## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


書くこと

使用技術

開発期間


開発の背景・きっかけ

大変だったこと

工夫したこと

反省・今後の課題


9/4/2023





また、なぜパスワード認証にこだわったかというと、個人的に認証画面を作りたかったっていうのもあるけど、このアプリは個人情報を集約しているため、セキュリティの必要性を感じだからです。


作った背景
初めて作ったアプリだからといって使わないアプリは作りたくなかった。
他にも同じようなアプリで自分が作ったのより使い勝手がいいものもあるかもしれないが、やる気なくすと思ったから調べなかった。自分はこのアプリのファンとして存分に活用していきたい。「完成したからもういいや」で終わる気はなくて、不便なところがあれば今後もmodifyも続けていくし、欲しいと思う機能があれば追加していきたい。更新の頻度がいずれ少なくなっていけばそれがこのアプリの完成なんだろうと思う。


うまくいかなかった箇所
パスワード認証
User-friendlyにするために、ログイン時に予めpasswordを初期値として入れたけど、ログインボタンを押したとき、パスワードがあってるにも関わらず入れなかった。発想はwebでよく見るパスワードの記録だから、スマホアプリじゃそもそも合わないのかなとか、自分のやり方は古臭いのかなとも思った。なので作ってる途中でスマホにはスマホの認証に合うやり方を今後は使っていけばいいと思ったし、もうちょっとflutterがわかったら、いずれ今のパスワード認証も変えると思う。しかし、思うように動かせなかったけど、技術的に得るものはものすごくたくさんあって、挑戦してよかったと思った。
変数を置く場所汚い・読みにくい
初めてのアプリ作成とstatefullwidgetをメインとして使うと決めた時点でコードが読みにくくなるだろうなとは覚悟してたけど、アプリが完成に近づくにつれてどんどん読みにくくなっていった。こう思ってること自体が問題を認識できているということだから勝手に読みやすくなる技術は自然と身につけていくと思う。
ビジネス・プライベート用の２種類だけじゃなくて、ユーザーがリストを追加して名刺をカスタマイズできるようにしたかった
Main manuでFloatingActionbuttonを使ってユーザーがリストを追加してリストの名前を決めて、それぞれの用途にあったカードをユーザーがカスタマイズできるようにしたかったけど、おそらくそれをやるには承継系の理解が必要だし、テンプレートファイルの追加削除とファイル操作の理解、あるいはインスタンスを呼び出すことが必要で、さらにデータを記録するとして、shared_preferenceの辞書型でどうやってkeyの変数を変えるんだろうということを考えていったら今の自分には技術的に無理だと考えて、ビジネス用とプライベート用の２種類で作っていくことにした。これはいずれ追加したい
カード横にスワイプしてQRコード一覧の画面を追加したかった
Lineとかの自分のQRコードを登録する画面を作っておいてそれぞれのカードにQRコードを管理する画面を作りたかったけど、時間がかかりそうだと思って作らなかった。技術的にはもうできると思う。
Githubを使わないで開発した
自分がgithubを使いこなせるかどうか自信が持てず、結局VBAで作った時みたいに、ある程度やったらファイルコピーでバックアップを取る。技術的に難しそうだなと思ったらコピーして実験してみるとかをPC上で全部やっててGithubを全く使わないで作り切ってしまった。これを書いてる今は次のアプリを作る前にGitの使い方に慣れておいて、次こそはGitを使ってバージョン管理をしながら作っていきたいと思ってる。





# profile_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

