#! /bin/bash

if [ "$1" == "" ]; then
	text="Que me gusta la bash!!!!"
else
	text=$1
fi

mkdir -p foo/dummy
mkdir -p foo/empty

echo $text > foo/dummy/file1.txt
touch foo/empty/file2.txt

cat foo/dummy/file1.txt > foo/dummy/file2.txt

mv foo/dummy/file2.txt foo/empty/file2.txt
	
