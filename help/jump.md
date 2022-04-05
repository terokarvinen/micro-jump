# micro-jump - Jump to function in micro editor

Jump to any function, class or heading with F4. Go, Markdown, Python, C... A plugin for micro editor.

This help file can be viewed in Micro editor with ctrl-E 'help jump'. 

## Supported languages

Jump supports all languages supported by your ctags. My 'ctags --list-languages' has 44 entries: Ant, Asm, Asp, Awk, Basic, BETA, C, C++, C#, Cobol, DosBatch, Eiffel, Erlang, Flex, Fortran, Go, HTML, Java, JavaScript, Lisp, Lua, Make, MatLab, ObjectiveC, OCaml, Pascal, Perl, PHP, Python, REXX, Ruby, Scheme, Sh, SLang, SML, SQL, Tcl, Tex, Vera, Verilog, VHDL, Vim, YACC, markdown.

## Installation

Install prerequisites. Jump requires fzf, ctags and bash. On Debian 11-Bullseye, the installation is

	$ sudo apt-get update
	$ sudo apt-get install micro fzf exuberant-ctags

In some Ubuntu versions, ctags package name is different and the command is 'sudo apt-get install micro fzf ctags'. For other Linuxes, just install the packages that provide commands 'fzf', 'ctags' and 'bash'. Micro jump has not been tested on Windows or Mac OSX. 

	$ micro --plugin install jump

Now try it out!

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

Your cursor now landed on the function. Well done!

## Modifying the Jump Key

The default key binding F4 works automatically, and you only need to modify bindings if you want to change it. Key bindings can be changed in $HOME/.config/micro/bindings.json

Default binding is 

	{ "F4": "command:jumptag" }

## Markdown Support

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

As Jump shows MarkDown headings in document order, it also provides you an interactive table of contents. 

Go write that book!

## See also

https://github.com/terokarvinen/micro-jump

Copyright 2020-2022 Tero Karvinen https://TeroKarvinen.com

