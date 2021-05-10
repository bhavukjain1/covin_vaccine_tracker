#!/bin/bash

city=$1
telegram_token=$2
chat_id=$3

#651


current_week=$(date +%d-%m-%Y)
second_week=$(gdate +%d-%m-%Y -d "$(gdate) + 7 day")
third_week=$(gdate +%d-%m-%Y -d "$(gdate) + 14 day")

final=$(./covin.sh $city $current_week)
final+='\n'
final+=$(./covin.sh $city $second_week)
final+='\n'
final+=$(./covin.sh $city $third_week)


# echo "$final"

while read line; do
	#statements
	curl -X POST "https://api.telegram.org/bot$telegram_token/sendMessage" -d "chat_id=$chat_id" -d "text=$line"
done < <(echo -en "$final")