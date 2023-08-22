# Converting EPUB file to PDF for reasons of accessibility and cross-platform exchange

This is often daunting procedure, particularly when the file is complex. Based on complexity of file, I advise use of either of two procedures. For starters, often the suggestion in the internet is to go with Calibre to convert it into RTF format or so which then could be read by LibreOffice Writer and finally be converted to any formats (including pdf). But, my recipie is quite programmatic or minimalist and does not involve Libre or Calibre.

Just have the following executables:

- pandoc
- SumatraPDF

For a fairly simple epub with only minimal text, and so with it properly formatted, pandoc (version above 3.x does at least) does the conversion. Although, in many situations, the output file is not what you would want. Text and images are jumbled up/juxtaposed together, breaking up the alignment and spacings, thus making the output bland. However, one obvious benefit that comes with pandoc conversion is could be attributed to use of custom pdf-engine. You may tinker around it a little longer to find just the right engine to work your way. Note that 'pdflatex' is particularly bad at converting the modern xml based input (epub) to a polished pdf. I think "XeLaTeX" or "LuaLaTeX" might have an edge on that.

For example, I took the following script right off a stackoverflow thread and it worked. Not in the best possible way, as I already mentioned, though.

```
pandoc -s -t latex --toc --top-level-division=chapter --pdf-engine=pdflatex "C:\Users\Asus\Downloads\some_crappy_book.epub" -o "more_crappy_looking_book.pdf"
```

The second solution using SumatraPDF and the print to PDF (feature native to any decent printing driver contained computer) gives a more predictabe output. Since you will find the pdf look exactly like when it was being viewed (at least without tinkering with rendering settings; that could be done too by changing configuration settings of the SumatraPDF), you will love the output. But the process takes too much time, much of which is dedicated to print spooler. But you don't have to bang your head thinking about how your output might look, at least. The problem with this technique, although, is that everything now is composed of raster dots. (price of being printer friendly !) Not even plain texts are text symbols now. Therefore the output pdf is of exhorbitantly huge file size even for a small epub. But, don't succumb to filesize issue to go for this technique when you have your epub 20-50 mb. It works just fine.

