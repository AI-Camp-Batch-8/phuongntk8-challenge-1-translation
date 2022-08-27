# qai-hackathon-smt
Backup SMT code and data for QAI Hackathon - Challenge 1 (Smart Menu)


First, run notebook `data/data_preprocess.ipynb` for data spliting.

Then run notebook `run_scripts.ipynb` to train a translation model and make prediction on new text.

## Predict on OCR output
Put the OCR output in Vietnamese in file `predict/input.vi`, each dish on one line
Run script 09_predict.sh to get result in file `predict/output.en`.



**IMPORTANT** input file needs to have one blank line at the end, otherwise the last line of the input file will not be translated.