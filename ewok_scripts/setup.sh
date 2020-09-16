#!/bin/bash

set -eux

clearall=${1:-"NO"}

fv3bundle_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." >/dev/null 2>&1 && pwd )"

export PATH="$ecflow_ROOT/bin:$PATH"
export PYTHONPATH="$ecflow_ROOT/lib/python3.8/site-packages"

export JEDI_SRC=${fv3bundle_dir}
export JEDI_BIN=${fv3bundle_dir}/build/bin
export EWOK_TMP=${fv3bundle_dir}/ewok_tmp

if [[ $clearall =~ [yYtY] ]]; then

  unset JEDI_BIN
  unset JEDI_SRC
  unset EWOK_TMP

  export PYTHONPATH=$(echo ${PYTHONPATH} | awk -v RS=: -v ORS=: '/ecflow/ {next} {print}' | sed 's/:*$//')
  export PATH=$(echo ${PATH} | awk -v RS=: -v ORS=: '/ecflow/ {next} {print}' | sed 's/:*$//')

fi
