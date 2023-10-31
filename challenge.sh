#!/bin/bash
#prompt the user for their name
read -p "What is your name? " name 
#define variables
#suffix will be the suffix from existing files like: matt25 would be 25
#largest will save the largest suffix value for later when we create more files
suffix=0
largest=0
#for each file in the current directory..
for file in *; do
		#check if the file exists, otherwise skip this iteration
		[ -f "$file" ] || continue
		#get suffix from filename
		#this strips only the inputted name from the front of the filename, leaving us with just the suffix number
		suffix="${file##*$name}"
		#compare the suffix to the largest number we have seen so far
		if (($suffix>$largest));then
			#if it was larger, overwrite largest with the new, bigger number
			largest=$suffix
		fi
done

#setup the range of numbers for the loop
largest=$(($largest+1))
end=$(($largest+24))
#for largest found suffix plus one, to 25 more..
for (( i = $largest; i <= $end; i++ ));do
	#define our filename and then create it
	filename="$name$i"
	touch $filename
done
echo "Script complete"
#sources that helped me

#get suffix from filename
	#https://tldp.org/LDP/abs/html/refcards.html#AEN22664
	#https://unix.stackexchange.com/questions/461058/what-is-the-concept-of-shortest-sub-string-match-in-unix-shell
#check if file exists, otherwise skip
	#https://unix.stackexchange.com/questions/453502/what-does-f-mean-in-an-if-statement-in-a-bash-script

