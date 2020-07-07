#!/bin/bash 

readonly dailyBudget=100;
readonly betPerGame=1;
readonly numberOfDays=3;

day=1;
totalEarning=0;
todayBudget=0;
max=0;

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
		if [[ $day -eq 3 ]]
		then
			echo "you can continue to next month"
		fi

	else
		echo "you lost for day $day"
		 if [[ $day -eq 3 ]]
      then
         echo "you cannot continue to next month"
      fi
	fi

#	if [[ $todayBudget -gt max ]]
#	then
#		max=$(($todayBudget))
#		luckyDay=$(($day))
#	fi

	echo "earning till now $todayBudget"
	day=$(($day+1))

done
