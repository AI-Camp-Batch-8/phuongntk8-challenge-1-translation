Two approaches to solve the translation problem are SMT and NMT.

This directory contain data and a notebook to build an NMT model.
The model is built with OpenNMT-py.

OpenNMT-py is the [PyTorch](https://github.com/pytorch/pytorch) version of the [OpenNMT](https://opennmt.net) project, an open-source (MIT) neural machine translation framework.

Result of NMT is: *BLEU = **17.53*** which is worse than result of SMT (*BLEU = **42.10***).



|     | BLEU score | Detail format:  overall_score, BLEU-1/BLEU-2/BLEU-3/BLEU-4                     |
|-----|:----------:|--------------------------------------------------------------------------------|
| NMT | **17.53**  | 17.53, 67.6/37.9/20.8/14.0 (BP=0.596, ratio=0.659, hyp_len=3505, ref_len=5319) |
| SMT | **42.10**  | 42.10, 71.4/47.3/34.4/28.3 (BP=0.989, ratio=0.989, hyp_len=5260, ref_len=5319) |


Reason for low performance in NMT: lack of data. NMT requires much more data compared with SMT.

Steps to re-produce reported results:
- Step 1: upload folder `qai_hackathon_nmt` on Google Drive
- Step 2: open the notebook `qai_hackathon_smart_menu_translate.ipynb` in Google Colab
- Step 3: run the note book to get the output file `pred_1000.txt`
- Step 4: measure BLEU score with script `eval_nmt.sh`