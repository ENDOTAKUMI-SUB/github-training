# README

```
ルートに戻る
$ cd 

デスクトップに移動
$ cd Desktop 

リモートリポジトリからクローンしてくる
$ git clone https://github.com/ENDOTAKUMI/github-training

クローンしてきたディレクトリに移動
$ cd github-training 

リモートリポジトリからfetchする
$ git fetch origin develop

developブランチにに移動
$ git checkout develop

今いるブランチを確認
$ git branch

ブランチを作成
$ git checkout -b feature/XXXXXXX

今いるブランチを確認
$ git branch

vimでファイルを作成
$ vim XXXXX.md
(Iキーで入力可能→Escキー→:wqで保存

======

変更を確認
$ git status

addする
$ git add XXXXX.md

変更を確認　緑になってる
$ git status 

コミットする
$ git commit -m "create XXXXX.md"

プッシュする
$ git push

====== ここを繰り返し、なるべく細かく変更を記録する

完成したらGitHub上でプルリクする。

developブランチに移動
$ git checkout develop


```
