#!/bin/bash

mkdir -p tmpdoc/
for i in  agg_seg bldtree bw cp_parm delint dict2tri inc_comp \
	  init_gau init_mixw kmeans_init make_quests mixw_interp \
	  mk_flat mk_mdef_gen mk_mllr_class mk_model_def \
	  mk_s2cb mk_s2hmm mk_s2phone mk_s2phonemap mk_s2sendump \
	  mk_s3gau mk_s3mixw mk_ts2cb mllr_solve mllr_transform \
	  norm param_cnt printp prunetree tiestate
do 
echo $i
./bin.i686-pc-cygwin/$i > tmp 2>&1 
./bin.i686-pc-cygwin/$i -help yes > help 
./bin.i686-pc-cygwin/$i -example yes > example 
perl ./scripts_pl/texFormat.pl tmp tmpdoc/${i}.tex $i help example
done

rm tmp help example