#!/bin/bash

echo "script name is : $0"
echo "it is going to be backed up in the file $0.backup"
echo "..."
cp ./$0 ./"$0.backup"
echo "done"
