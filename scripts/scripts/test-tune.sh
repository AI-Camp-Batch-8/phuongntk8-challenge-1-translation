# Tune the model for the optimized configuration - the optimized weight-set for moses.ini

root_dir=`pwd`

cd $root_dir/corpus

~/moses/scripts/tokenizer/tokenizer.perl -l vi < $root_dir/corpus/training/test.vi > test.tok.vi
~/moses/scripts/tokenizer/tokenizer.perl -l en < $root_dir/corpus/training/test.en > test.tok.en

~/moses/scripts/recaser/truecase.perl -model truecase-model.vi < test.tok.vi > test.true.vi
~/moses/scripts/recaser/truecase.perl -model truecase-model.en < test.tok.en > test.true.en


## filter: has not done 

# You can test the decoder by first translating the test set (takes a wee while) then running the BLEU script on it: --this different compared with the online script -for moses.ini location. Idk the meaning of -v 3

echo "Testing the model after tuning..."

nohup nice ~/moses/bin/moses -f $root_dir/working/mert-work/moses.ini -v 3 < $root_dir/corpus/test.true.vi > $root_dir/corpus/test-tuned.translated.en 2> test-tune.out

#nohup nice ~/moses/bin/moses -f ~/working/train/model/moses.ini -v 3 < ~/corpus/test.true.en > ~/corpus/test-tuned.translated.vi 2> test-tune.out

~/moses/scripts/generic/multi-bleu.perl -lc $root_dir/corpus/test.true.en < $root_dir/corpus/test-tuned.translated.en > $root_dir/corpus/BLEU-report-tune.txt

grep "BEST TRANSLATION" $root_dir/corpus/test-tune.out > $root_dir/corpus/BEST-TRANSLATION-tune.txt
