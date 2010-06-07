= popup-dododo - �W���W���� ���ʉ�(?) ��\������

  * Author: MIYAMUKO Katsuyuki ((<URL:mailto:miyamuko (at) gmail.com>))
  * URL: ((<URL:http://miyamuko.s56.xrea.com/xyzzy/popup-dododo/intro.htm>))
  * Version: 0.0.1


== SYNOPSIS

popup-dododo - �W���W���� ���ʉ�(?) ��\������

== SYNOPSIS

  (require "popup-dododo")

  (popup-dododo :�h (point))
  (popup-dododo :�h�b�M���@�[�� :mouse :size 300 :color '(255 0 0))
  (popup-dododo :�S33 (point) :x-repeat 3 :timeout 10)

  ;; �t�b�N�̒ǉ�
  (add-popup-dododo-on-mouse #\LBtnDown :�S5 :size 40 :x-repeat 3)
  (add-popup-dododo-on-mouse #\RBtnDown :�h :color '(255 0 0))
  (add-popup-dododo-on-command 'kill-line :�Y�L���E�E�E�� :color '(0 0 255) :size 200)
  (add-popup-dododo-on-command-char #\RET :�����^�@ :color '(255 0 0))
  (add-popup-dododo-on-command 'other-window :�t�����c :color '(255 0 0))
  (add-popup-dododo-on-command 'split-window :�X�H�H�H :color '(255 0 0))
  (add-popup-dododo-on-command 'delete-other-windows :�K�b�V�� :color '(255 0 0))

  ;; �t�b�N�̍폜
  (remove-popup-dododo-on-mouse #\LBtnDown :�S3)
  (remove-popup-dododo-on-mouse #\RBtnDown :�h)
  (remove-popup-dododo-on-command 'kill-line :�Y�L���E�E�E��)
  (remove-popup-dododo-on-command-char #\RET :�����^�@)

  ;; �t�b�N��S���폜
  (clear-popup-dododo-on-mouse)
  (clear-popup-dododo-on-command)
  (clear-popup-dododo-on-command-char)


== DESCRIPTION

popup-dododo �̓W���W�����̌��ʉ�(?) �� xyzzy ��Ƀ|�b�v�A�b�v�\������A�v���P�[�V�����ł��B

popup-dododo �𗘗p����Ε��i�� xyzzy �ł̕ҏW��ƂɋC�������邱�Ƃł��傤�B

== INSTALL

popup-dododo �𗘗p����ɂ�
((<"�f�X�N�g�b�v �h�h�h"|URL:http://massacre.s59.xrea.com/game/dtddd/download.htm>))
�ɕt���� DesktopDoDoDo �t�H���g���C���X�g�[�����Ă������� (Windows\Font �t�H���_�ɃR�s�[)�B

((<NetInstaller|URL:http://www7a.biglobe.ne.jp/~hat/xyzzy/ni.html>)) �ŃC���X�g�[�������ꍇ�� 4 �ȍ~���A
NetInstaller + ni-autoload ���g���Ă���l�� 5 �ȍ~�� OK �ł��B

(1) cairo �� layered-window ���C���X�g�[�����܂� (NetInstaller �ŃC���X�g�[���\�ł�)�B

    * ((<URL:http://miyamuko.s56.xrea.com/xyzzy/cairo/intro.htm>))
    * ((<URL:http://miyamuko.s56.xrea.com/xyzzy/layered-window/intro.htm>))

(2) �A�[�J�C�u���_�E�����[�h���܂��B

    ((<URL:http://miyamuko.s56.xrea.com/xyzzy/archives/popup-dododo.zip>))

(3) �A�[�J�C�u��W�J���āA$XYZZY/site-lisp �z���Ƀt�@�C�����R�s�[���܂��B

(4) ~/.xyzzy �܂��� $XYZZY/site-lisp/siteinit.l �Ɉȉ��̃R�[�h��ǉ����܂��B

        ;; popup-dododo
        (require "popup-dododo")

(5) �ݒ�𔽉f�����邽�� xyzzy ���ċN�����Ă��������B

    ��siteinit.l �ɋL�q�����ꍇ�ɂ͍ă_���v���K�v�ł��B

(6) add-popup-dododo-on-xxx �Ńt�b�N���d�|����Ƃ����ł��傤�B


== MODULE

=== �O���t��

popup-dododo �Ɏw��\�ȃO���t���͈ȉ��̂Ƃ���ł��B

  * ��
  * �@ (�S�p��)
  * �h�b�M���@�[��
  * �Y�L���E�E�E��
  * �����^�@ 
  * �X�H�H�H
  * �t�����c
  * �K�b�V��
  * �h[1-35] (�h1 ���� �h35 �܂ł���܂�)
  * �S[1-45] (�S1 ���� �S45 �܂ł���܂�)

�O���t���͕�����܂��̓L�[���[�h�Ŏw�肵�܂��B
�Ȃ��A���������炢 typo ���Ă��F�����܂��B

��̓I�Ȏ��̂�
((<"site-lisp/popup-dododo/docs/desktopdododo-glyphs.png"|URL:http://miyamuko.s56.xrea.com/xyzzy/images/desktopdododo-glyphs.png>))
���Q�l�ɂ��Ă��������B


=== PACKAGE

popup-dododo �͈ȉ��̃p�b�P�[�W�𗘗p���Ă��܂��B

  * popup-dododo.api

    popup �\�����s�����C�u�����B

  * popup-dododo.editor

    popup �\�����s���R�}���h�A�t�b�N�֐��ȂǁB
    �����I�� user, editor �p�b�P�[�W���� use-package ���܂��B

=== EXPORT

popup-dododo �͈ȉ��̃V���{���� export ���Ă��܂��B

  * popup-dododo.api �p�b�P�[�W

    * *popup-dododo-glyph-name-list*
    * popup-dododo-window
    * hide-dododo-window
    * show-dododo-window
    * dododo-window-exist-p
    * dododo-window-visible-p
    * move-dododo-window
    * destroy-dododo-window
    * destroy-all-dododo-window

  * popup-dododo.editor �p�b�P�[�W

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

���Ƃł����B

=== COMMAND

���Ƃł����B


=== FUNCTION

���Ƃł����B


== TODO

* ���ߏ����� layered-window ���g�킸�Ƀ}�X�N�ōs��
* �A�j���[�V����
  * AnimateWindow
  * SDL?
  * �t�F�[�h�C���E�A�E�g
  * �X���C�h�C���E�A�E�g
  * ��]�E�g��E�k��
* ���s�[�g�����̃t�H���g�̔z�u�������Ƃ܂��߂ɂ���
* �΂ߕ����Ƀ��s�[�g
* �����̐F��ς��Ȃ��烊�s�[�g (�O���f�[�V����)
* �����̑傫����ς��Ȃ��烊�s�[�g
* popup window �\�����������C�u������
* �t�b�N����̏������y������
* DesktopDoDoDo �t�H���g�̑��݃`�F�b�N
* �G���[����
* �h�L�������g


== KNOWN BUGS

�Ȃ��B


== AUTHOR

�݂�ނ� ���䂫 (((<URL:mailto:miyamuko (at) gmail.com>)))


== SEE ALSO

  : �f�X�N�g�b�v �h�h�h
        ((<URL:http://massacre.s59.xrea.com/game/dtddd/download.htm>))


== COPYRIGHT

popup-dododo �� MIT/X ���C�Z���X�ɂ��������ė��p�\�ł��B

See popup-dododo/docs/MIT-LICENSE for full license.


== NEWS

<<<NEWS.rd

=end
