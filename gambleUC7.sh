#!/bin/bash 

readonly dailyBudget=100;
readonly betPerGame=1;
readonly numberOfDays=3;

day=1;
totalEarning=0;
todayBudget=0;
max=0;
loseAmount=0
winAmount=0
lastday=3

while (( day < numberOfDays+1 ))
do
	todayBudget=$(($todayBudget+$dailyBudget))
	upperLimit=$(( ($todayBudget/2)+$todayBudget ))
	lowerLimit=$(( $todayBudget-($todayBudget/2) ))
#	echo $upperLimit
#	echo $lowerLimit
        while [[ $todayBudget -lt $upperLimit ]] && [[ $todayBudget -gt $lowerLimit ]]
        do
				bet=$(($RANDOM%2))

        		if [[ $bet -eq 0 ]]
        		then
        			todayBudget=$(($todayBudget-$betPerGame))
        		else
        			todayBudget=$(($todayBudget+$betPerGame))
        		fi


        done

	if [[ $todayBudget -eq $upperLimit ]]
	then

		echo "you won for day $day"
		winAmount=$(($winAmount+$todayBudget))

	else
		echo "you lost for day $day"
		loseAmount=$(($lossAmount+$todayBudget))
	fi

	echo "earning till now $todayBudget"
	day=$(($day+1))

	if [[ $day -eq 4 ]] 
	then
		if [[ $winAmount -lt $loseAmount ]]
		then
			echo "Donot continue to next month........."
		else
			echo "Continue to next month........."
		fi
	fi

done
