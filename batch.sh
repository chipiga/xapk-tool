#!/bin/bash

IFS=$'\n';
for dir in $(find $1 -type d)
do
    if [[ $(find $dir -type d | wc -l) -eq 1 ]]; then # no subdirs
        # echo $dir;
        if compgen -G "${dir}/*.xapk" > /dev/null; then
            echo === $dir = SKIP;
        else
            python xapktool.py $dir 2> /dev/null;
            echo === $dir = $?;
            # exit
        fi
    fi
done;
