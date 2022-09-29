
#!/bin/bash
#set -e

# Translate english Localizable-*.strings to spanish in Feature and Libs directories

find "../ios/Features" "../ios/Libs" -type f -name 'Localizable*.strings' -not -name "*-HIDE*" -path "*/en.lproj/*" -print0 |
while IFS= read -r -d '' file; do
    basename="$(basename "$file")"
    enDir="$(dirname "$file")"
    ressourceDir="$(dirname "$enDir")"
    esDir="${ressourceDir}/es.lproj/"
    echo "Next dir: ${esDir}"
    python3 translate.py -f $file
    mv "output/es.lproj/${basename}" $esDir
done
