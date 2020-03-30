# This option will search in the filename for two occurances of character "e"
ls | grep "e\{2\}"

# This option will search in the filename for whitespace characters including tabs, pagebreaks, space and others.
ls | grep "\s"
# Use a plus modifier to look for more than one occurances.
ls | grep "\s\+"

# To look for a single whitespace character that is space use following.
ls | grep "[[:blank:]]"
# A modifier plus sign may be used to alter the number of occurances to look for.

# A special character \t will match tabs
