# Converting an image gallery (organized in a directory) to a pdf document

`convert -auto-orient "*.{jpg,jpeg}" -quality 70 policies_summary_and_some_other.pdf`

## Conversion occurs in the order of default listing of files in the file system

- An alternative to supply manual order of the file is by piping operation
- In windows (or for other cases) renaming the files may be the best option. Renaming can be accomplished fully in `R`! with following snippet, for example.

### Prefixing the filenames with numbers based on last modified time/date

```
doc_file_infos <- file.info(list.files("."))
doc_file_infos_sorted = doc_file_infos[with(doc_file_infos, order(as.POSIXct(mtime))), ]

paste0(1:48, "_", rownames(doc_file_infos_sorted))

file.rename(rownames(doc_file_infos_sorted), paste0(1:48, "_", rownames(doc_file_infos_sorted)))
```

(Note: To handle number-prefixed names consistently pad smaller numberic strings with zero at the beginning)

## Notes

- Make sure to use double quotes (Single quotes do not work in windows!)
- Setting quality above 80 does improve quality significantly, although at a much greater price of compilation speed.
- To create a sophisticated renaming scheme using exif information follow through the file detailing the procedures of extracting exif data from a image or media file.
