#!/bin/zsh

projectDir=CIS415/proj2/

# First we append the saved layout of worspace N to workspace M
i3-msg "append_layout ~/.i3/debugLayout.json"

# And finally we fill the containers with the programs they had
(urxvt -name "editor" -e $SHELL -c "cd "$projectDir";vim part1.c;$SHELL -i"&)
(urxvt -name "valgrind" -e $SHELL -c "cd "$projectDir";valgrind --leak-check=full ./main easy.txt;$SHELL -i"&)
(urxvt -name "gdb" -e $SHELL -c "cd "$projectDir";gdb --args main easy.txt;$SHELL -i"&)
(urxvt -name "git" -e $SHELL -c "cd "$projectDir";git status;$SHELL -i"&)
