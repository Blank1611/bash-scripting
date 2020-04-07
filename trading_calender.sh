#!/bin/bash


#downloading and storing the html file in trading_calender.html file
wget -O trading_calender.html https://www.lseg.com/areas-expertise/our-markets/london-stock-exchange/equities-markets/trading-services/business-days 


#extracting the dates
awk '/169/{getline;print}' trading_calender.html |awk '{gsub("<h5>..</h5>","dates");print}' |awk '{gsub("<h5>","");print}' |awk '{gsub("</h5>","");print}' |awk '{gsub("<b>","");print}' |awk '{gsub("</b>","");print}'>./dates

#extracting the reasons
awk '/163/{getline;print}' trading_calender.html |grep h5 |awk '{gsub("<h5>..</h5>","reason");print}' |awk '{gsub("<h5>","");print}' |awk '{gsub("</h5>","");print}' |awk '{gsub("<b>","");print}' |awk '{gsub("</b>","");print}' |awk '{gsub("<span>","");print}' |awk '{gsub("</span>","");print}'>./reasons

#merging the dates and reasons file into a csv file
paste -d "," ./dates ./reasons >./trading_calender.csv

#displaying the result
echo 'Result is stored in ./trading_calender.csv'
cat ./trading_calender.csv