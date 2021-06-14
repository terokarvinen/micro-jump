# micro-jump - Jump to function in micro editor

Jump to any function, class or heading with F4. Go, Markdown, Python, C... A plugin for micro editor. 

## Install

Prerequisites. Ctags extracts headings, functions and classes. Fzf shows the interactive fuzzy find to choose where to jump. These instructions have been tested with Ubuntu 20.04 and Debian 10 Buster. For older Linuxes, you might need to install fzf from source. 

	$ sudo apt-get update
	$ sudo apt-get -y install fzf ctags git

The plugin. If you have never ran micro before, start 'micro' and quit it with Ctrl-Q to create configuration files. 

	$ mkdir $HOME/.config/micro/plug/
	$ cd $HOME/.config/micro/plug/
	$ git clone https://github.com/terokarvinen/micro-jump
	$ cd

## Use F4 to Jump

	$ micro tero.py

Write some Python. Jump also supports Go, C, JavaScript...

```python
def hello():
    print("hello")

def bar():
    print("bar")

def foo():
    print("foo")
```

Ctrl-S Save. 

Press F4 to jump. Use up and down arrows to select a function. You can also type part of the name. Press enter to jump.

## Language support

Probably whatever ctags supports. My 'ctags --list-languages' has 44 entries: 
Ant, Asm, Asp, Awk, Basic, BETA, C, C++, C#, Cobol, DosBatch, Eiffel, Erlang, Flex, Fortran, Go, HTML, Java, JavaScript, Lisp, Lua, Make, MatLab, ObjectiveC, OCaml, Pascal, Perl, PHP, Python, REXX, Ruby, Scheme, Sh, SLang, SML, SQL, Tcl, Tex, Vera, Verilog, VHDL, Vim, YACC, markdown. 

## MarkDown Support

Markdown configuration is in examples/ctags. 

	$ cp -nv $HOME/.config/micro/plug/micro-jump/examples/ctags $HOME/.ctags

To test it, write some Markdown.

	$ micro book.md

```markdown
# Hello

Hello Tero

## Foo

More text
```

Ctrl-S Save. 

Press F4 to jump. You can see your table of contents, and select between the headings "Hello" and "Foo". 

Well done, you have now installed micro-jump and Markdown support. 

Copyright 2020-2021 Tero Karvinen https://TeroKarvinen.com
Code repository https://github.com/terokarvinen/micro-jump
MIT license
