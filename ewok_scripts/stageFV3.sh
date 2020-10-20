#!/bin/bash

set -eux

cd $JEDI_SRC

fv3jedi_dir="$JEDI_SRC/fv3-jedi"
fv3jedi_r2d2_dir="$EWOK_TMP/R2D2"

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
