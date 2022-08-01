# This is for tuning the model to attain the optimal parameters in moses.ini


echo "Tuning the model..."

root_dir=`pwd`

cd $root_dir/corpus

# We're going to use dev.* en vi for tuning, so we have to tokenise and truecase it first 

~/moses/scripts/tokenizer/tokenizer.perl -l vi < training/dev.vi > dev.tok.vi
~/moses/scripts/tokenizer/tokenizer.perl -l en < training/dev.en > dev.tok.en

~/moses/scripts/recaser/truecase.perl --model truecase-model.vi < dev.tok.vi > dev.true.vi
~/moses/scripts/recaser/truecase.perl --model truecase-model.en < dev.tok.en > dev.true.en


# Now go back to the directory we used for training, and launch the tuning process:
cd $root_dir/working
nohup nice ~/moses/scripts/training/mert-moses.pl $root_dir/corpus/dev.true.vi $root_dir/corpus/dev.true.en ~/moses/bin/moses train/model/moses.ini --mertdir ~/moses/bin &> mert.out &


#If you have several cores at your disposal, then it'll be a lot faster to run Moses multi-threaded. Add --decoder-flags="-threads 4" to the last line above in order to run the decoder with 4 threads. With this setting, tuning took about 4 hours for me.

#The end result of tuning is an ini file with trained weights, which should be in ~/working/mert- work/moses.ini 
