#!/bin/bash

dailyBudget=100;

readonly betPerGame=1;

bet=$(($RANDOM%2))

if [[ $bet -eq 0 ]]
then
    dailyBudget=$(($dailyBudget-$betPerGame))
else
    dailyBudget=$(($dailyBudget+$betPerGame))
fi

echo $dailyBudget

