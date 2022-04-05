# micro-jump - Jump to function in micro editor

Jump to any function, class or heading with F4. Go, Markdown, Python, C... A plugin for micro editor.

This help file can be viewed in Micro editor with ctrl-E 'help jump'. 

## Supported languages

Jump supports all languages supported by your ctags. My 'ctags --list-languages' has 44 entries: Ant, Asm, Asp, Awk, Basic, BETA, C, C++, C#, Cobol, DosBatch, Eiffel, Erlang, Flex, Fortran, Go, HTML, Java, JavaScript, Lisp, Lua, Make, MatLab, ObjectiveC, OCaml, Pascal, Perl, PHP, Python, REXX, Ruby, Scheme, Sh, SLang, SML, SQL, Tcl, Tex, Vera, Verilog, VHDL, Vim, YACC, markdown.

## Installation

Install prerequisites. Jump requires fzf, ctags and bash. On Debian 11-Bullseye, the installation is

	$ sudo apt-get update
	$ sudo apt-get install micro fzf exuberant-ctags

In some Ubuntu versions, ctags package name is different and the command is 'sudo apt-get install micro fzf exuberant-ctags'. For other Linuxes, just install the packages that provide commands 'fzf', 'ctags' and 'bash'. Micro jump has not been tested on Windows or Mac OSX. 

	$ micro --plugin install jump

Now try it out. Write a Python file "tero.py" with a couple of functions, ctrl-S to save and F4 to jump. 

## F4 to Jump 

The default key binding F4 works automatically, and you only need to modify bindings if you want to change it. Key bindings can be changed in $HOME/.config/micro/bindings.json

Default binding is 

	{ "F4": "command:jumptag" }

## Markdown Support

Markdown configuration is in examples/ctags/. 

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

## See also

https://github.com/terokarvinen/micro-jump

Copyright 2020-2022 Tero Karvinen https://TeroKarvinen.com

