#!/usr/bin/env bash

set -e

echo
echo "Installing gems locally"
echo '= = ='

cmd="bundle install --standalone --path=./gems --with=development"

echo $cmd
($cmd)

echo '- - -'
echo '(done)'
echo
