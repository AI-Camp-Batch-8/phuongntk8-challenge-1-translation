# This script measures NMT result using BLEU metric

root_dir=`pwd`

echo "Measuring BLEU score..."

$root_dir/moses/scripts/generic/multi-bleu.perl -lc $root_dir/corpus/test.true.en < $root_dir/predict/pred_1000.txt > $root_dir/corpus/BLEU-NMT.txt

echo "DONE"

