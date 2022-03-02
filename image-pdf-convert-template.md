# Converting an image gallery (organized in a directory) to a pdf document

convert -auto-orient "*.{jpg,jpeg}" -quality 70 policies_summary_and_some_other.pdf

## Notes

- Make sure to use double quotes (Single quotes do not work in windows!)
- Setting quality above 80 does improve quality significantly, although at a much greater price of compilation speed.