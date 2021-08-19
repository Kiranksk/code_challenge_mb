#!/bin/bash
#purpose to create sample file and run the script and clean the test files

mkdir todo
touch todo/test1.txt todo/test2.txt todo/test3.txt

mkdir todo/todo1

touch todo/todo1/test1.txt todo/todo1/test2.txt todo/todo1/test3.txt

cat >todo/test1.txt <<EOL
He she it
He she it
He She it they
kit cat put he He she
EOL

cp todo/test1.txt todo/test2.txt
cp todo/test1.txt todo/test3.txt
cp todo/test1.txt todo/todo1/test1.txt
cp todo/test1.txt todo/todo1/test2.txt
cp todo/test1.txt todo/todo1/test3.txt

sh string_count.sh $(pwd) txt

rm -rf todo/
