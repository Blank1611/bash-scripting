#!/bin/bash
function timerf(){
for s in {1..180}
do
echo `date -d day +%T`
sleep 1
done
}
timerf > ./timerf.log &
procc=`echo $!`
timeout 10s tail -f ./timerf.log
kill $procc
