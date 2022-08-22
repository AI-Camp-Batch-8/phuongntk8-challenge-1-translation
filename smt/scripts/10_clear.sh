# This script is used to remove file and directories from previous moses' trainng and testing session

root_dir=`pwd`

cd $root_dir/corpus/training/
rm *.en *.vi
cd ..
rm *.en *.vi *.out *.txt
cd $root_dir/lm/
rm *.en
# To remove a directory that contain other files or directories:
rm -r $root_dir/working
