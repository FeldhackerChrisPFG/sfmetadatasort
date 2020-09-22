# sfmetadatasort
Sorts Salesforce metadata XML files (MDAPI format) in effort to minimize merge conflicts.

## Requirements
- xsltproc Linux utility installed and available on the PATH
- copy the build/* directory and contents to the root of your repository containing Salesforce metadata files

File system structure:
  - build / (sh and xslt files)
  - src / applications
        / duplicateRules
        / layouts
        / (etc.)
  
## Usage
- From the root of the repository execute the "sortxml-xslt.sh" script
