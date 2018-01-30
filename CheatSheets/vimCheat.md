# Vim cheat sheet:
^E - scroll the window down
^Y - scroll the window up
^F - scroll window down
^B - scroll window up
 H - move cursor to the top of the window
 M - move cursor to the middle of the window
 L - move cursor to the bottom of the window
gg - go to top of file
 G - go to the bottom of the file

Text objects:
w - words
s - sentences
p - paragraphs
t - tags

Motions:
a - all
i - in
t - till
f - find forward
F - find backward
% - move to matching brackets
!: - execute external command

Commands:
d - delete(also cut)
c - change(delete, then place in insert mode)
y - yank(copy)
v - visually select
R - replace more than one char

Additional Commands:
dd/yy - delete/yank the current line
D/C - delete/change untill end of line
^/$ - move to the beginning/end of line
I/A - start insert at the beginning/end of the line
O/o - insert new line above/below current line and insert
m{register}   - mark a line and move to it by '{register}

[number]{command}{text object or motion}

Record a macro:
q{register}
 ->(do the things)
q

Play a macro
@{register}

plugin to check:
vundle
nerdtree
ctrpl
fugitive
syntastic

Awesome features
:r <something> - insert something to current line
:v <someting> - save visualised lines to something
