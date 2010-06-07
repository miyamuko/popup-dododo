= popup-dododo - ジョジョ風 効果音(?) を表示する

  * Author: MIYAMUKO Katsuyuki ((<URL:mailto:miyamuko (at) gmail.com>))
  * URL: ((<URL:http://miyamuko.s56.xrea.com/xyzzy/popup-dododo/intro.htm>))
  * Version: 0.0.1


== SYNOPSIS

popup-dododo - ジョジョ風 効果音(?) を表示する

== SYNOPSIS

  (require "popup-dododo")

  (popup-dododo :ド (point))
  (popup-dododo :ドッギャァーン :mouse :size 300 :color '(255 0 0))
  (popup-dododo :ゴ33 (point) :x-repeat 3 :timeout 10)

  ;; フックの追加
  (add-popup-dododo-on-mouse #\LBtnDown :ゴ5 :size 40 :x-repeat 3)
  (add-popup-dododo-on-mouse #\RBtnDown :ド :color '(255 0 0))
  (add-popup-dododo-on-command 'kill-line :ズキュウウウン :color '(0 0 255) :size 200)
  (add-popup-dododo-on-command-char #\RET :メメタァ :color '(255 0 0))
  (add-popup-dododo-on-command 'other-window :フワリ… :color '(255 0 0))
  (add-popup-dododo-on-command 'split-window :スォォォ :color '(255 0 0))
  (add-popup-dododo-on-command 'delete-other-windows :ガッシン :color '(255 0 0))

  ;; フックの削除
  (remove-popup-dododo-on-mouse #\LBtnDown :ゴ3)
  (remove-popup-dododo-on-mouse #\RBtnDown :ド)
  (remove-popup-dododo-on-command 'kill-line :ズキュウウウン)
  (remove-popup-dododo-on-command-char #\RET :メメタァ)

  ;; フックを全部削除
  (clear-popup-dododo-on-mouse)
  (clear-popup-dododo-on-command)
  (clear-popup-dododo-on-command-char)


== DESCRIPTION

popup-dododo はジョジョ風の効果音(?) を xyzzy 上にポップアップ表示するアプリケーションです。

popup-dododo を利用すれば普段の xyzzy での編集作業に気合が入ることでしょう。

== INSTALL

popup-dododo を利用するには
((<"デスクトップ ドドド"|URL:http://massacre.s59.xrea.com/game/dtddd/download.htm>))
に付属の DesktopDoDoDo フォントをインストールしてください (Windows\Font フォルダにコピー)。

((<NetInstaller|URL:http://www7a.biglobe.ne.jp/~hat/xyzzy/ni.html>)) でインストールした場合は 4 以降を、
NetInstaller + ni-autoload を使っている人は 5 以降で OK です。

(1) cairo と layered-window をインストールします (NetInstaller でインストール可能です)。

    * ((<URL:http://miyamuko.s56.xrea.com/xyzzy/cairo/intro.htm>))
    * ((<URL:http://miyamuko.s56.xrea.com/xyzzy/layered-window/intro.htm>))

(2) アーカイブをダウンロードします。

    ((<URL:http://miyamuko.s56.xrea.com/xyzzy/archives/popup-dododo.zip>))

(3) アーカイブを展開して、$XYZZY/site-lisp 配下にファイルをコピーします。

(4) ~/.xyzzy または $XYZZY/site-lisp/siteinit.l に以下のコードを追加します。

        ;; popup-dododo
        (require "popup-dododo")

(5) 設定を反映させるため xyzzy を再起動してください。

    ※siteinit.l に記述した場合には再ダンプが必要です。

(6) add-popup-dododo-on-xxx でフックを仕掛けるといいでしょう。


== MODULE

=== グリフ名

popup-dododo に指定可能なグリフ名は以下のとおりです。

  * ■
  * 　 (全角空白)
  * ドッギャァーン
  * ズキュウウウン
  * メメタァ 
  * スォォォ
  * フワリ…
  * ガッシン
  * ド[1-35] (ド1 から ド35 まであります)
  * ゴ[1-45] (ゴ1 から ゴ45 まであります)

グリフ名は文字列またはキーワードで指定します。
なお、すこしぐらい typo しても認識します。

具体的な字体は
((<"site-lisp/popup-dododo/docs/desktopdododo-glyphs.png"|URL:http://miyamuko.s56.xrea.com/xyzzy/images/desktopdododo-glyphs.png>))
を参考にしてください。


=== PACKAGE

popup-dododo は以下のパッケージを利用しています。

  * popup-dododo.api

    popup 表示を行うライブラリ。

  * popup-dododo.editor

    popup 表示を行うコマンド、フック関数など。
    自動的に user, editor パッケージから use-package します。

=== EXPORT

popup-dododo は以下のシンボルを export しています。

  * popup-dododo.api パッケージ

    * *popup-dododo-glyph-name-list*
    * popup-dododo-window
    * hide-dododo-window
    * show-dododo-window
    * dododo-window-exist-p
    * dododo-window-visible-p
    * move-dododo-window
    * destroy-dododo-window
    * destroy-all-dododo-window

  * popup-dododo.editor パッケージ

    * popup-dododo

    * add-popup-dododo-on-command
    * add-popup-dododo-on-command-char
    * add-popup-dododo-on-mouse

    * remove-popup-dododo-on-command
    * remove-popup-dododo-on-command-char
    * remove-popup-dododo-on-mouse

    * clear-popup-dododo-on-command
    * clear-popup-dododo-on-command-char
    * clear-popup-dododo-on-mouse


=== VARIABLE

あとでかく。

=== COMMAND

あとでかく。


=== FUNCTION

あとでかく。


== TODO

* 透過処理を layered-window を使わずにマスクで行う
* アニメーション
  * AnimateWindow
  * SDL?
  * フェードイン・アウト
  * スライドイン・アウト
  * 回転・拡大・縮小
* リピート処理のフォントの配置をもっとまじめにする
* 斜め方向にリピート
* 文字の色を変えながらリピート (グラデーション)
* 文字の大きさを変えながらリピート
* popup window 表示部分をライブラリ化
* フック周りの処理を軽くする
* DesktopDoDoDo フォントの存在チェック
* エラー処理
* ドキュメント


== KNOWN BUGS

なし。


== AUTHOR

みやむこ かつゆき (((<URL:mailto:miyamuko (at) gmail.com>)))


== SEE ALSO

  : デスクトップ ドドド
        ((<URL:http://massacre.s59.xrea.com/game/dtddd/download.htm>))


== COPYRIGHT

popup-dododo は MIT/X ライセンスにしたがって利用可能です。

See popup-dododo/docs/MIT-LICENSE for full license.


== NEWS

<<<NEWS.rd

=end
