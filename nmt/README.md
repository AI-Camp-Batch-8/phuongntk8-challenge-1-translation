This directory contains data and a notebook to build an NMT model.
The model is built with OpenNMT-py.

OpenNMT-py is the [PyTorch](https://github.com/pytorch/pytorch) version of the [OpenNMT](https://opennmt.net) project, an open-source (MIT) neural machine translation framework.

Result of NMT is: *BLEU = **17.53*** which is worse than result of SMT (*BLEU = **42.10***).

Steps to re-produce reported results:
- Step 1: upload folder `qai_hackathon_nmt` on Google Drive
- Step 2: open the notebook `qai_hackathon_smart_menu_translate.ipynb` in Google Colab
- Step 3: run the note book to get the output file `pred_1000.txt`
- Step 4: measure BLEU score with script `eval_nmt.sh` in `smt/scripts` folder.