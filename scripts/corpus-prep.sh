##### Corpus Preparation

# To train a TRANSLATION system, we need parallel data (text translated into two different languages) which is aligned at the sentence level.

# To prepare the data for training the TRANSLATION system, we have to perform the following steps:

#	1. Tokenisation: this means that spaces have to be inserted between (e.g.) words and punctuation.

#	2. Trucasing: the initial words in each sentence are converted to their MOST PROBABLE casing. This helps REDUCE DATA SPARSITY.

#	3. Cleaning: long sentences and empty sentences are removed as they can cause problems with the traing pipeline, and obviously MIS-ALIGNED sentences are removed.

root_dir=`pwd`

#  mkdir -p $root_dir/corpus/training/ # flag -p is used to create the directory if it doesn't exist

# 1. The TOKENISATION can be run as follows:

echo "Tokenizing the corpus..."

~/moses/scripts/tokenizer/tokenizer.perl -l vi < $root_dir/corpus/training/train.vi > $root_dir/corpus/train.tok.vi 

~/moses/scripts/tokenizer/tokenizer.perl -l en < $root_dir/corpus/training/train.en > $root_dir/corpus/train.tok.en 


# 2.1. The truecaser first requires training, in order to extract some statistics about the text:

echo "Training truecase..."

~/moses/scripts/recaser/train-truecaser.perl --model $root_dir/corpus/truecase-model.vi --corpus $root_dir/corpus/train.tok.vi

~/moses/scripts/recaser/train-truecaser.perl --model $root_dir/corpus/truecase-model.en --corpus $root_dir/corpus/train.tok.en


# 2.2. Truecasing uses another scripts from the Moses distribution:

echo "Truecasing the data..."

~/moses/scripts/recaser/truecase.perl --model $root_dir/corpus/truecase-model.vi < $root_dir/corpus/train.tok.vi > $root_dir/corpus/train.true.vi

~/moses/scripts/recaser/truecase.perl --model $root_dir/corpus/truecase-model.en < $root_dir/corpus/train.tok.en > $root_dir/corpus/train.true.en


# 3. Finally, we clean, limiting sentence length to 80:

echo "Limiting the sentence length to 80..."

~/moses/scripts/training/clean-corpus-n.perl $root_dir/corpus/train.true vi en $root_dir/corpus/train.clean 1 80

# Notice that the last command processes both sides at once.



