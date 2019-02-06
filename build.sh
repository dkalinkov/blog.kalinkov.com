#!/usr/bin/env bash

hugo --theme cactus
rm -rf docs
cp -r public docs

