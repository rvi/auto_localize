
#!/bin/bash
set -e

# This script takes a path to a en.lproj/Localizable.string file, translate it in spanish
# and move the translated file to es.lproj/Localizable.string

basename="$(basename "$1")"
enDir="$(dirname "$1")"
ressourceDir="$(dirname "$enDir")"
esDir="${ressourceDir}/es.lproj/"

echo "Next dir: ${esDir}"
python3 translate.py -f $1

mv "output/es.lproj/${basename}" $esDir