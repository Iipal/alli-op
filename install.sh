#!/bin/bash

cp alli-op .alli-op-tmp

echo "Configure alli-op for your sytem..."
UNAME_S=$(uname -s)
if [ -z "$UNAME_S" ]; then
    echo "Something went wrong, maybe you dont have \'uname\' command ?"
elif [ "$UNAME_S"  == "Darwin" ]; then
    sed '41,42d' alli-op > .alli-op-tmp
elif [ "$UNAME_S" == "Linus" ]; then
    sed '4,8d' alli-op > .alli-op-tmp
    sed '13,18d' alli-op > .alli-op-tmp
fi

echo "Copying alli-op to ~/.alli-op..."
cp .alli-op-tmp ~/.alli-op

echo "Adding ~/.alli-op to your ~/.*shell_name*rc..."
if [ "$SHELL" == "/bin/zsh" ]; then
    echo "source ~/.alli-op" >> ~/.zshrc
elif [ "$SHELL" == "/bin/bash" ]; then
    echo "source ~/.alli-op" >> ~/.bashrc
else
    echo "ERROR: Supports only ZSH and bash. Try to add \"source ~/.alli-op\" by yourself in your ~/.*shell_name*rc"
fi

rm -f .alli-op-tmp

echo "Done. Please restart your shell."