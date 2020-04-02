#!/bin/bash


echo '  ______      _             _                       
 / _____)    | |           | |      _               
| /      ____| | ____ _   _| | ____| |_  ___   ____ 
| |     / _  | |/ ___) | | | |/ _  |  _)/ _ \ / ___)
| \____( ( | | ( (___| |_| | ( ( | | |_| |_| | |    
 \______)_||_|_|\____)\____|_|\_||_|\___)___/|_|    
                                                    '
                                                 
echo -e '\nThis is a Calculator script.\n'
echo -e "\n---------------------------------------------------------------------\n"

function adder(){
local intfloat
echo "You have selected ADDITION"
user_input
results=`awk "BEGIN {printf ($var1+$var2)}"`
#printf "Result: %.2f\n" $results
}

function subtractor(){
echo "You have selected SUBTRACTION"
user_input
results=`awk "BEGIN {printf ($var1-$var2)}"`
#printf "Result: %.2f\n" $results
}

function dividor(){
echo "You have selected DIVISION"
user_input
results=`awk "BEGIN {printf ($var1/$var2)}"`
#printf "Result: %.2f\n" $results
}

function multiplicator(){
echo "You have selected MULTIPLICATION"
user_input
results=`awk "BEGIN {printf ($var1*$var2)}"`
#printf "Result: %.4f\n" $results
}

function user_input() {
while true
do
local var1_check
local var2_check
read -p "Enter first number: " var1
read -p "Enter second number: " var2
int_float $var1
var1_check=`echo $?`
int_float $var2
var2_check=`echo $?`
if [[ $var1_check = 105 || $var1_check = 102 ]]
then
if [[ $var2_check = 105 || $var2_check = 102 ]]
then
break
else
printf "\nPlease enter a valid input, only integers and decimal numbers are accepted"'!!'"\n"
fi
else
printf "\nPlease enter a valid input, only integers and decimal numbers are accepted"'!!'"\n"
fi

done
}

function output_func(){
int_float $results
intfloat=`echo $?`
if [[ $intfloat = 105 ]]
then
printf "Result: %d\n" $results
elif [[ $intfloat = 102 ]]
then
printf "Result: %.2f\n" $results
fi
}

function int_float(){
local num_check=$1
if [[ $num_check =~ ^[+-]?[0-9]*$ ]]
then
return 105
elif [[ $num_check =~ ^[+-]?[0-9]+\.?[0-9]*$ ]]
then
return 102
fi
}

function terminate_script(){
local terminate_var
printf "\nWould you like to continue? y/n: "
while true
do
read terminate_var
if [[ $terminate_var = n ]]
then
return 110
elif [[ $terminate_var = y ]]
then
return 121
else
printf "\nPlease enter a valid choice y/n: "
fi
done
}


function calmenu(){
while true
do

local choices
local var1
local var2
local results

printf "\n1) Addition
2) Subtraction
3) Multiplication
4) Division
5) Exit
"

read -p "Choose an option: " choices

case $choices in 
1)adder;;
2)subtractor;;
3)multiplicator;;
4)dividor;;
5)break;;
*)printf "\nPlease enter a valid choice"'!!'"\n";continue
esac

output_func

terminate_script
terminate_var=`echo $?`
if [[ $terminate_var = 110 ]]
then
break
else
continue
fi
 
done
}

#driver code
printf '\n**** MENU ****\n'
calmenu
printf '\nThank you for using this application\n'
