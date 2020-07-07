#!/bin/bash

dailyBudget=100;

readonly betPerGame=1;


while (( 1 ))
do
  bet=$(($RANDOM%2))

   if [[ $bet -eq 0 ]]
   then
      dailyBudget=$(($dailyBudget-$betPerGame))
   else
      dailyBudget=$(($dailyBudget+$betPerGame))
   fi

   if [[ $dailyBudget -gt 150 ]] || [[ $dailyBudget -lt 50 ]]
   then
       echo "done for the day"
       break;
   fi

   echo $dailyBudget

done
