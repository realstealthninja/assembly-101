#!/bin/bash

if [ -z $1 ]; then
  echo "Usage: ./asm64 <asmMainFile> (no extension)"
  exit
fi

if [ ! -e "$1.asm" ]; then
  echo "Error, $1.asm not found."
  echo "Note, do not enter file extensions."
  exit
fi

yasm -Worphan-labels -g dwarf2 -f elf64 $1.asm -l $1.lst
ld -g -o $1 $1.o
