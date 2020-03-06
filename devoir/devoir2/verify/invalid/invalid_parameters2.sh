#!/bin/bash
# 10

outputfile=$1
testfile=$2

python3 busybox.py rm -r &> $outputfile
scriptresult=$?

echo "Invalid command" > $testfile

diff -q $outputfile $testfile
if [ $? != 0 ]
then
    echo 'Script does not print Invalid command when command is not correct.' > $testfile
    exit -1 
else
    if [ $scriptresult != 1 ]
    then
        echo 'Script does not return 1 when command is not correct.' > $testfile
        exit -1
    fi
fi

exit 0

