#!bin/usr/env bash
for file in $(ls); do
    
    name=$file;
    nameNew=$file+'_back'
    
    grep -E "\S+" $file > $nameNew

    
    mv $nameNew $name
    
done
