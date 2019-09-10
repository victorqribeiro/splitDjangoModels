#!/bin/bash

[[ $1 ]] || { echo "Usage: $0 filename.py"; exit; }

modelfile=$1

#clean comments
sed '1,10d' $modelfile -i

# split files by class name
csplit -b "%04d.py" -z $modelfile /^class/ {*}

# add import to class and rename files by class name
all="__all__ = ["
for i in xx*.py;
	do
		classname=$(head -1 $i | cut -d " " -f2 | cut -d "(" -f1 | tr -d '[:space:]');
		filename=$(echo $classname | tr '[:upper:]' '[:lower:]')
		sed '1i from django.db import models\n\n' $i -i;

		imports=($(sed -n 's/.*ForeignKey(\(.*\))/\1/p' $i | cut -d "," -f1 | sed "s/'//g"))

		for import in ${imports[@]}
			do
			importfile=$(echo $import | tr '[:upper:]' '[:lower:]')
			sed "1a from .$importfile import $import" $i -i
			done

		mv $i $filename".py";
		echo "from ."$filename" import "$classname >> __init__.py
		all+="\"$classname\", "
		done
all+="]"

# add all to __init__.py 
echo -e "\n\n"$all >> __init__.py
