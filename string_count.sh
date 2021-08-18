#!/bin/bash
set -x
#This script will recursively count all uniq string occurance in file

findoccurrence(){
directory=$(pwd)
file_extension="*"  # allowed values *, *.pdf, *.sql etc...

if [ ! -z $1 ]; then
        directory=$1
else
        exit 0
fi


if [ ! -z $2 ]; then
        file_extension="*.$2"
else
        exit 0
fi

for filename in $(find $directory -type f -name "$file_extension") ; do
echo `cat $filename` | tr " " "\n" | sort | tr -dc '[:alnum:]\n\r' >> total.txt;
done

#sorting all the strings and counting the uniq values
cat total.txt | sort | uniq -c >> count.txt

#ordeing the output as required
echo "Output"
awk '{print $2,$1}' count.txt

rm -rf count.txt total.txt

}


usage() {

echo "
usage: $script_name -p|--path <folder path>
                -e|--ext <file extension>
                [--help]

Options:
-p|--path <folder path>
-e|--ext <file extension>
--help: show this help
"
}


all_params="$@"
echo $all_params
findoccurrence $@
