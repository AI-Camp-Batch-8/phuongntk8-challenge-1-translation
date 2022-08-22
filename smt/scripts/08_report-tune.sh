# copy corpus file to report dir

root_dir=`pwd`

mkdir -p $root_dir/experiments

echo "Pls enter directory name to save some data and BLEU report for the given dataset: "
read name


mkdir -p $root_dir/experiments/$name
cp $root_dir/corpus/training/train.vi $root_dir/experiments/$name
cp $root_dir/corpus/training/train.en $root_dir/experiments/$name
cp $root_dir/corpus/training/test.vi $root_dir/experiments/$name
cp $root_dir/corpus/training/test.en $root_dir/experiments/$name
cp $root_dir/corpus/training/dev.vi $root_dir/experiments/$name
cp $root_dir/corpus/training/dev.en $root_dir/experiments/$name
cp $root_dir/corpus/training/language-model.en $root_dir/experiments/$name
cp $root_dir/corpus/test-tuned.translated.en $root_dir/experiments/$name
cp $root_dir/corpus/BLEU-report-tune.txt $root_dir/experiments/$name
cp $root_dir/working/mert-work/moses.ini $root_dir/experiments/$name/moses-tune.ini
cp $root_dir/working/mert-work/filtered/moses.ini $root_dir/experiments/$name/moses-config.ini
cp $root_dir/corpus/BEST-TRANSLATION-tune.txt $root_dir/experiments/$name
