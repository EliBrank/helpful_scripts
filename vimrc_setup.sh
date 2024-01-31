#!/bin/bash

# setup vimrc file
cat <<EOF > ~/.vimrc
set fo=croql
set number relativenumber
set cindent
syntax on
EOF
