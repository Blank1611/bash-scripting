#!/bin/bash
ME=`logname`
PATH=$PATH:/efs/dist/data/ref/1/common

for i in {1..365}
do
var1=`date -d -"$i"day +%Y-%m-%d`
echo $var1
getUniverse LSE >/data/log/$ME/$var1.log &
done

for i in {4..365}
do
var1=`date -d -"$i"day +%Y-%m-%d`
echo $var1
rm /data/log/$var1.log
done