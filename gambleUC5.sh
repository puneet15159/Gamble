#!/bin/bash 

dailyBudget=100;
readonly betPerGame=1;
readonly numberOfDays=20

day=0;
totalEarning=0;

while (( day < numberOfDays ))
do
        while [[ $dailyBudget -lt 150 ]] && [[ $dailyBudget -gt 50 ]]
        do
				bet=$(($RANDOM%2))

        		if [[ $bet -eq 0 ]]
        		then
        			dailyBudget=$(($dailyBudget-$betPerGame))
        		else
        			dailyBudget=$(($dailyBudget+$betPerGame))
        		fi


        done


	if [[ $dailyBudget -eq 150 ]]
	then
		echo "You won for day $day"
	else
		echo "you lost for day $day"
	fi 	

   totalEarning=$(($dailyBudget+$totalEarning))
   echo "Total earnings after Day $day"
   echo $totalEarning
   day=$(($day+1))
   dailyBudget=100;
done

if [[ $totalEarning -gt 2000 ]]
then
        echo "Profit"
else
        echo "Loss"
fi
