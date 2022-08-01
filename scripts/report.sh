# copy corpus file to report dir
root_dir=`pwd`

mkdir -p $root_dir/experiments

echo "Pls enter directory name"
read name


mkdir -p $root_dir/experiments/$name
cp $root_dir/corpus/training/train.vi $root_dir/experiments/$name
cp $root_dir/corpus/training/train.en $root_dir/experiments/$name
cp $root_dir/corpus/training/test.vi $root_dir/experiments/$name
cp $root_dir/corpus/training/test.en $root_dir/experiments/$name
cp $root_dir/corpus/training/language-model.en $root_dir/experiments/$name
cp $root_dir/corpus/test.translated.en $root_dir/experiments/$name
cp $root_dir/corpus/BLEU-report.txt $root_dir/experiments/$name
cp $root_dir/working/train/model/moses.ini $root_dir/experiments/$name
cp $root_dir/corpus/BEST-TRANSLATION.txt $root_dir/experiments/$name
