#!/bin/bash

myVar=1

while [ $myVar -le 10 ]
do
  echo $myVar
  myVar=$(( $myVar +1 ))
  sleep 0.5
done
