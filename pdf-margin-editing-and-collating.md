# Cropping pdf margins and collating a document

1. Install PdfCropMargins from https://github.com/abarker/pdfCropMargins
2. Launch application gui with following

```
pdf-crop-margins -v -s -u -gui your-file.pdf
```

- In the GUI, tweak around with the values and find the best combination
- Cropping in the PdfCropMargins generates a new file ending with "_cropped", (so no worries for original file loss)
- While cropping, aim to reduce the margin from all side so that output page geometry of the collated document matches well with individual pages which are margin-cropped. (To be fair, this is more of an art than science.)

3. Run a tex compilation with `\includepdfmerge{}` command. An example that generates 2 x 1 collated page from margin cropped file look like the one shown below.

```
\documentclass[a4paper]{article}
\usepackage[margin=0mm,nohead,nofoot,landscape]{geometry}
% \usepackage[a4paper,
%             bindingoffset=0.2in,
%             left=1in,
%             right=1in,
%             top=1in,
%             bottom=1in,
%             footskip=.25in]{geometry}
\usepackage{pdfpages}
\pagestyle{empty}
\parindent0pt
\begin{document}
% \includepdfmerge[nup=2x3,pages={1-4},frame=false,landscape]{martin_warez.pdf}
\includepdfmerge[nup=2x1,pages={1-11},frame=false]{chen2018_cropped.pdf}
\end{document}
```