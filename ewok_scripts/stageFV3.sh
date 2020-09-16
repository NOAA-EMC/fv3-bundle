#!/bin/bash

set -eux

fv3bundle_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." >/dev/null 2>&1 && pwd )"

cd $fv3bundle_dir

fv3jedi_dir="$fv3bundle_dir/fv3-jedi"
fv3jedi_r2d2_dir="$fv3bundle_dir/R2D2_fv3jedi"

[[ ! -d $fv3jedi_dir ]] && ( echo "Source area $fv3jedi_dir does not exist, ABORT!"; exit 1)

# Create staging area directories for r2d2 data
[[ -d $fv3jedi_r2d2_dir ]] && ( echo "Staging area $fv3jedi_r2d2_dir exists, ABORT!"; exit 1)
mkdir -p $fv3jedi_r2d2_dir
mkdir -p $fv3jedi_r2d2_dir/Data
mkdir -p $fv3jedi_r2d2_dir/Data/fieldsets
mkdir -p $fv3jedi_r2d2_dir/Data/fv3files
mkdir -p $fv3jedi_r2d2_dir/Data/inputs

# Copy files from fv3-jedi to the r2d2 staging area

# Copy fieldsets
cp $fv3jedi_dir/test/Data/fieldsets/dynamics.yaml $fv3jedi_r2d2_dir/Data/fieldsets/

# Copy static fv3files
cp $fv3jedi_dir/test/Data/fv3files/akbk64.nc4 $fv3jedi_r2d2_dir/Data/fv3files/
cp $fv3jedi_dir/test/Data/fv3files/field_table $fv3jedi_r2d2_dir/Data/fv3files/
cp $fv3jedi_dir/test/Data/fv3files/fmsmpp.nml $fv3jedi_r2d2_dir/Data/fv3files/
cp $fv3jedi_dir/test/Data/fv3files/input_gfs_c12.nml $fv3jedi_r2d2_dir/Data/fv3files/
cp $fv3jedi_dir/test/Data/fv3files/inputpert_4dvar.nml $fv3jedi_r2d2_dir/Data/fv3files/

# Copy restarts
cp $fv3jedi_dir/test/Data/inputs/gfs_c12/bkg/* $fv3jedi_r2d2_dir/Data/inputs/

tree -L 3 $fv3jedi_r2d2_dir

exit
