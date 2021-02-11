# micro-jump - Jump to function in micro editor

Jump to any function, class or heading with F4. Go, Markdown, Python, C... A plugin for micro editor. 

## Install

Prerequisites. Ctags extracts headings, functions and classes. Fzf shows the interactive fuzzy find to choose where to jump.

	$ sudo apt-get update
	$ sudo apt-get -y install fzf ctags git

The plugin

	$ cd $HOME/.micro/plug/
	$ git clone https://github.com/terokarvinen/micro-jump

Usage

	$ micro tero.md

Write some Markdown. Jump also supports Go, Python, C...

```markdown
# Hello

Hello Tero

## Foo

More text
```

Press F4. Use up and down arrows to select heading "Hello" or "Foo". You can also type part of the name. 

## Language support

Probably whatever ctags supports. My 'ctags --list-languages' has 44 entries: 
Ant, Asm, Asp, Awk, Basic, BETA, C, C++, C#, Cobol, DosBatch, Eiffel, Erlang, Flex, Fortran, Go, HTML, Java, JavaScript, Lisp, Lua, Make, MatLab, ObjectiveC, OCaml, Pascal, Perl, PHP, Python, REXX, Ruby, Scheme, Sh, SLang, SML, SQL, Tcl, Tex, Vera, Verilog, VHDL, Vim, YACC, markdown. 

Tero Karvinen http://TeroKarvinen.com

https://github.com/terokarvinen/micro-jump
