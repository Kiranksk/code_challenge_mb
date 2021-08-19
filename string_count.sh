#!/bin/bash
#This script will recursively count all uniq string occurance in file

findoccurrence(){

directory=$(pwd)
file_extension="*"  # allowed values *, *.pdf, *.sql etc...
echo $1 $2

#checking the parameters are NOT NULL
if { [ -d "${1}" ] &&  [ -n "${2}" ]; }; then
            directory=$1
            file_extension="*.$2"
fi

for filename in $(find $directory -type f -name "$file_extension") ; do
echo `cat $filename` | tr " " "\n" | sort | tr -dc '[:alnum:]\n\r' >> total.txt;
done

#sorting all the strings and counting the uniq values
cat total.txt | sort | uniq -c >> count.txt

#ordeing the output as required
echo "Output"
awk '{print $2,$1}' count.txt

#removing the counter files
rm -rf count.txt total.txt

}


usage() {
echo "
usage: sh script_name <folder path> <file extension> | <-h>

Options:
<folder path> : valid folder path if it is not valid it will take default as PWD
<file extension> : desired file extension if empty it will take wild card * as default
-h: show this help


eg: sh challenge.sh /home/todo txt   #<To find the .txt file in directory /home/todo>
"
}


all_params="$@"
#echo $all_params
if [ "$1" == "-h" ]; then
        usage
        exit 0
fi

#call the main function with all parameters 
findoccurrence $@

