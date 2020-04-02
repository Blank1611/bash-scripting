#!/bin/bash
function extractPath(){
local IFS=:
echo $PATH
}
for i in $(extractPath)
do
if [ -x ${i} ]
then
echo `ls -sh $i`
else
continue
fi
done




 for i in $(pathsexec); do if [ -x ${i} ]; then echo "${i} is exec"; else echo "not"; fi; done 


#!/bin/bash
function extractPath(){
local IFS=:
echo $PATH
}
for i in $(extractPath)
do
if [ -x ${i} ]
then
#dat=`ls -lah $i|awk '{print $5}'`
echo `du $i -h`
#echo $dat $i
else
continue
fi
done

function sizeexecr(){ 
local IFS=':'; 
find $PATH -maxdepth 1 -type f -executable -exec basename {} \;|sort; 
} 

for i in $(sizeexecr); do echo $i;echo `ls -lah $i`; done


for i in $(extractPath)
do if [ -x ${i} ]
then data=`ls -sh $i|awk '/total/{print}'`
echo $data $i
else continue
fi
done