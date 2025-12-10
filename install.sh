#!/usr/bin/env bash

set -e

RUST_PROJECTS="swayws-rs"

cd projects/

for i in $RUST_PROJECTS; do
    if [[ ! -d "$i" ]] ; then
	git clone "git@github.com:Jonas205/$i.git"
    else
	git -C "$i" pull origin main
    fi
    cd "$i"
    cargo install --path .
    cd ..
done

cd ..
