#! /bin/bash

# Sorts Salesforce XML files using custom XSLT for each metadata file type, which lessens the
# likelihood of encountering merge conflicts in the metdata files.
# Unfortunately, Salesforce metdata file format has multiple elements with the same name without a 
# parent "container" element.  This makes sorting difficult with numerous tools.  
# Even with XSLT, sorting these specific mixed elements causes the elements to become unsorted overall.
# Therefore, files are sorted twice, once with an XSLT file specific to the metdata type, then a 
# second time with a generic XSLT file that restores the overall sorting of elements.

OLDIFS=$IFS
IFS=$'\n'


echo "Sorting Applications...(1/3)"
for f in src/applications/*.app; do
xsltproc build/application.xslt "$f" | xsltproc build/standardsort.xslt - > result.xml
mv result.xml "$f"
done

echo "Sorting Layouts...(2/3)"
for f in src/layouts/*.layout; do
xsltproc build/layout.xslt "$f" | xsltproc build/standardsort.xslt - > result.xml
mv result.xml "$f"
done

echo "Sorting Duplicate Rules...(3/3)"
for f in src/duplicateRules/*.duplicateRule; do
xsltproc build/duplicateRule.xslt "$f" | xsltproc build/standardsort.xslt - > result.xml
mv result.xml "$f"
done


IFS=$OLDIFS