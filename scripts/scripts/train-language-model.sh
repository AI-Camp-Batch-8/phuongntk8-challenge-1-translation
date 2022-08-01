# The language model (LM) is used to ensure fluent output, so it is built with the target language (i.e. Latin Vietnamese in this case). The KenLM documentation gives a full explanation of the command-line options, but the following will build an appropriate 3-gram language model

root_dir=`pwd`

mkdir -p $root_dir/lm
cd $root_dir/lm

# 1. The TOKENISATION can be run as follows:

echo "Tokenizing the LM-corpus..."

~/moses/scripts/tokenizer/tokenizer.perl -l en < $root_dir/corpus/training/language-model.en > $root_dir/corpus/language-model.tok.en 

# 2.1. The truecaser first requires training, in order to extract some statistics about the text:

echo "Training LM-truecase..."

~/moses/scripts/recaser/train-truecaser.perl --model $root_dir/corpus/truecase-model-LM.en --corpus $root_dir/corpus/language-model.tok.en

# 2.2. Truecasing uses another scripts from the Moses distribution:

echo "Truecasing the LM-data..."

~/moses/scripts/recaser/truecase.perl --model $root_dir/corpus/truecase-model-LM.en < $root_dir/corpus/language-model.tok.en > $root_dir/corpus/language-model.true.en



echo "Training LM..." 

#~/moses/bin/lmplz -o 3 < ~/corpus/language-model.true.vi > language-model.arpa.vi
# change from 3-gram to 4-gram
~/moses/bin/lmplz -o 4 < $root_dir/corpus/language-model.true.en > language-model.arpa.en


# Then you should binarie (for faster loading) the language-model.arpa.vi file using KenLM:

~/moses/bin/build_binary language-model.arpa.en language-model.blm.en

# (Note that you can also use IRSTLM which also has a binary format that Moses supports. See the IRSTLM documentation for more information. For simplicity, we only describe one approach here.)
