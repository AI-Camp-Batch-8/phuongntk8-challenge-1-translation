# This script is used to translate multiple lines of a menu at a time
# Vietnamese texts are place in a file named 'input.vi'

root_dir=`pwd`

# switch -v means verbose
# $root_dir/moses/bin/moses -f $root_dir/working/train/model/moses.ini < $root_dir/predict/input.vi -v 2> $root_dir/predict/output_raw.en

$root_dir/moses/bin/moses -f $root_dir/working/train/model/moses.ini < $root_dir/predict/input.vi -v 1> $root_dir/predict/output.en 2> $root_dir/predict/output_raw.en
