# flymake-yaml.el

An Emacs flymake handler for syntax-checking YAML source code
using [`Psych`](https://github.com/tenderlove/psych) or `Syck`(Ruby 1.8/1.9 standard library).

Based in part on [http://d.hatena.ne.jp/kitokitoki/20120306/p1](http://d.hatena.ne.jp/kitokitoki/20120306/p1).

## Installation

If you choose not to use one of the convenient packages in
[Melpa][melpa] and [Marmalade][marmalade], you'll need to add the
directory containing `flymake-yaml.el` to your `load-path`, and then
`(require 'flymake-yaml)`. You'll also need to install
[flymake-easy](https://github.com/purcell/flymake-easy).

## Usage

Add the following to your emacs init file:

    (require 'flymake-yaml) ;; Not necessary if using ELPA package
    (add-hook 'yaml-mode-hook 'flymake-yaml-load)


[marmalade]: http://marmalade-repo.org
[melpa]: http://melpa.milkbox.net
