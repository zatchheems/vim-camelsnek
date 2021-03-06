vim-camelsnek
=============

[![Build Status](https://travis-ci.org/nicwest/vim-camelsnek.svg?branch=master)](https://travis-ci.org/nicwest/vim-camelsnek)

Convert between camel and snek case

![Usage](https://user-images.githubusercontent.com/8506829/95635740-dd389100-0a52-11eb-8c25-c6b215f9fc7f.gif)

Installation
------------

Use your favorite plugin manager of choice, ex. [vim-plug](https://github.com/junegunn/vim-plug).

Usage
-----

```viml
:Snek     " converts to snake_case               ('foo bar' -> 'foo_bar')
:Camel    " converts to CamelCase                ('foo bar' -> 'FooBar')
:CamelB   " converts to camelbackCase            ('foo bar' -> 'fooBar')
:Kebab    " converts to kebab-case               ('foo bar' -> 'foo-bar')
:Screm    " converts to SCREAMING_SNAKE_CASE     ('foo bar' -> 'FOO_BAR')
```

These commands will function from both normal and visual mode. When in normal
mode the commands will attempt to operate on the word object under cursor,
when in visual mode it will operate on the selection.

Settings
--------

```viml
" Some organisations use the terms Camel and Pascal to differentiate between
" the two variants of camel case. This setting changes the commands:
" :Camel  -> :Pascal
" :CamelB -> :Camel
let g:camelsnek_alternative_camel_commands = 1

" Are you a stick in the mud? This setting also changes the name of two commands:
" :Snek  -> :Snake
" :Screm -> :Snakecaps
let g:camelsnek_no_fun_allowed = 0
```

### Caveats

This plugin appends to your `iskeyword` global setting by default in order to make
editing kebab-case easier— in normal mode with this setting, you can place your cursor
over a kebab-case word and convert it to any other available case. This may not be
preferable if you don't like treating hyphens as part of words.

Other plugins or settings like `set nocompatible` may interfere with your `iskeyword`
setting. Be sure to load/set these before including _vim-camelsnek_ with your
plugin manager. Try `:verbose set iskeyword?` to find these if you're having trouble.

If you don't want this setting, there's a variable for that:

```viml
" Set this to prevent editing global keyword matching rules.
" With no override:
"   :echo &iskeyword
"   @,48-57,_,192-255,-
"
" With override set to 0:
"   :echo &iskeyword
"   @,48-57,_,192-255
let g:camelsnek_iskeyword_override = 0
```

Tests
-----

To run the tests pull the [themis test suite](https://github.com/thinca/vim-themis)
(you don't have to install it but you can if you want).

```shell
git clone git@github.com:thinca/vim-themis.git
./vim-themis/bin/themis --reporter dot test
```

Alternatively you can use the Makefile in the root dir, which will clone the
dependencies and run the tests and linter.

```shell
make init
make test
make lint
```
