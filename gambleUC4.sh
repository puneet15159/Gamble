#!/bin/bash

dailyBudget=100;
betPerGame=1;
day=0;
totalEarning=0;
while (( day < 30 ))
do
        while (( 1 ))
        do
                bet=$(($RANDOM%2))

        if [[ $bet -eq 0 ]]
        then
        dailyBudget=$(($dailyBudget-$betPerGame))
        else
        dailyBudget=$(($dailyBudget+$betPerGame))
        fi

        if [[ $dailyBudget -ge 150 ]] || [[ $dailyBudget -le 50 ]]
        then
        break;
        fi
        done

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

