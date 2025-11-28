#!/bin/bash
read -p "Enter the file name" File_Name:

if [[-f '$file_name']]; then
    echo "file exists"
else
    echo "file doesn't exists"
fi