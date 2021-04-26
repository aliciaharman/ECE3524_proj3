#!/bin/sh

OUTPUT=$2

# delete outfile if already exists
rm -f $OUTPUT

traverse() {   
    for file in $(ls "$1")
    do
        #current=${1}{$file}
        if [ ! -d ${1}/${file} ] # if file
        then
            echo "<li type=\"disc\">${file}</li>" >> $OUTPUT
        else
            if [ -r ${1}/${file} ] # if directory is readable
            then
                #echo "<ul type=\"square\">" >> $OUTPUT
                echo "<li>${file}" >> $OUTPUT
                echo "<ul type=\"circle\">" >> $OUTPUT
                traverse "${1}/${file}"
                echo "</ul></li>" >> $OUTPUT
            fi
        fi
    done
}

echo "<!DOCTYPE html>
<html>
<body>" >> $OUTPUT
echo "${1}" >> $OUTPUT
echo "<ul type=\"square\">" >> $OUTPUT
traverse "$1"
echo "</ul>" >> $OUTPUT
echo "</body>
</html>" >> $OUTPUT
