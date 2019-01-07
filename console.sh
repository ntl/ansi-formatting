#!/usr/bin/env sh

set -eu

irb \
  -I $LIBRARIES_HOME \
  -I ./gems \
  -r bundler/setup \
  -I lib/ \
  -r terminal_output/styling \
  -r terminal_output/styling/controls \
  --readline \
  --prompt simple \
  $@
