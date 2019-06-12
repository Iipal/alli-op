#!/bin/bash

cp alli-op .alli-op-tmp

echo "Configure alli-op for your sytem..."
UNAME_S=$(uname -s)
if [ -z "$UNAME_S" ]; then
    echo "Something went wrong, maybe you dont have \'uname\' command ?"
elif [ "$UNAME_S"  == "Darwin" ]; then
    sed '41,42d' alli-op > .alli-op-tmp
elif [ "$UNAME_S" == "Linux" ]; then
    sed '4,7d' alli-op > .alli-op-tmp
    sed '9,13d' .alli-op-tmp > .alli-op-tmp2
    mv .alli-op-tmp2 .alli-op-tmp
fi

echo "Copying alli-op to ~/.alli-op..."
cp .alli-op-tmp ~/.alli-op

echo -n "Adding ~/.alli-op to your "
if [[ "$SHELL" == "/bin/zsh" || "$SHELL" == "/usr/bin/zsh" ]]; then
    echo "~/.zshrc..."
    echo "source ~/.alli-op" >> ~/.zshrc
elif [[ "$SHELL" == "/bin/bash" || "$SHELL" == "/usr/bin/zsh" ]]; then
    echo "~/.bashrc..."
    echo "source ~/.alli-op" >> ~/.bashrc
else
    echo "ERROR: Supports only ZSH and bash. Try to add \"source ~/.alli-op\" by yourself in your ~/.*shell_name*rc"
fi

rm -f .alli-op-tmp

echo "Done. Please restart your shell."