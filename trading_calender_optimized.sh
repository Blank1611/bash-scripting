#!/bin/bash


#downloading and storing the html file in trading_calender.html file
wget -O trading_calender.html https://www.lseg.com/areas-expertise/our-markets/london-stock-exchange/equities-markets/trading-services/business-days 


#extracting the dates
awk '/169/{getline;gsub("<h5>..</h5>","dates");gsub("<h5>","");gsub("</h5>","");gsub("<b>","");gsub("</b>","");print}' trading_calender.html>./dates

#extracting the reasons
awk '/"163"/{getline;gsub("<h5>..</h5>","resaons");gsub("<h5>","");gsub("</h5>","");gsub("<b>","");gsub("</b>","");gsub("<span>","");gsub("</span>","");print}' trading_calender.html>./reasons

#merging the dates and reasons file into a csv file
paste -d "," ./dates ./reasons >./trading_calender.csv

#displaying the result
echo 'Result is stored in ./trading_calender.csv'
cat ./trading_calender.csv