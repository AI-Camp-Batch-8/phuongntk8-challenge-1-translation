# Finally we come to the main event - training the translation model (whose compoents are a phrase-table and a language model). To do this, we run word-alignment (using either mgiza or GIZA++), phrase extraction and scoring, create lexicalised reordering tables and create your Moses configuration file, all with a single command. I recommend that you create an appropriate directory as follows, and then run the training command, catching logs:

root_dir=`pwd`

mkdir -p $root_dir/working
cd $root_dir/working

echo "Training the model..." # use -mgiza -mgiza-cpus 2 instead of GIZA++ for faster running time? 

# --giza-option m1=4,m2=0,mh=4,m3=0,m4=3 (http://www.statmt.org/moses/?n=FactoredTraining.TrainingParameters)

nohup nice $root_dir/moses/scripts/training/train-model.perl -root-dir train -corpus $root_dir/corpus/train.clean -f vi -e en -alignment grow-diag-final-and -lm 0:4:$root_dir/lm/language-model.blm.en:8 -external-bin-dir $root_dir/moses/training-tools/ -mgiza -mgiza-cpus 2 >& training.out & #-cores 4


# If you have a multi-core machine, it's worth using the -cores argument to encourage as much parallelisation/parallelism as possbile

# When you come to run the training, you need to tell the training script where GIZA++ was installed using the -external-bin-dir argument as follows: train-model.perl -external-bin-dir $HOME/moses/tools
