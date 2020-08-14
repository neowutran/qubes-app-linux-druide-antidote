#!/bin/bash

name(){
    head -n 1 README.md | cut -d ' ' -f 2 | cut -d '(' -f 1 | cut -c5- | tr [:upper:] [:lower:]
}

description(){
    awk '/DESCRIPTION/,!//' ./README.md | tail -n +3 | awk '1;/=======/{exit}' | head -n -3
}

variable=${1:?Variable name is required. name, description or camelname}
case "$variable" in
    "name"):
	name
        ;;
    "description"):
	description
	;;
    "camelname"):
	name | sed 's/^\([A-Za-z0-9]\)\([A-Za-z0-9]\+\)-\([A-Za-z0-9]\)\([A-Za-z0-9]\+\)$/\U\1\L\2\U\3\L\4/g'
        ;;
    "summary"):
	description | head -n 1
	;;
    *):
	echo "This variable doesn't exist" >&2
	exit 1
	;;
esac
