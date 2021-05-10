#!/bin/bash

district_id=$1
date=$2
# date=$(date +%d-%m-%Y)
response=$(curl -s -k -X $'GET' \
    -H $'Host: c0sxbfi9ac.execute-api.ap-south-1.amazonaws.com' -H $'Cache-Control: max-age=0' -H $'Sec-Ch-Ua: \" Not A;Brand\";v=\"99\", \"Chromium\";v=\"90\", \"Google Chrome\";v=\"90\"' -H $'Sec-Ch-Ua-Mobile: ?0' -H $'Upgrade-Insecure-Requests: 1' -H $'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36' -H $'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' -H $'Sec-Fetch-Site: none' -H $'Sec-Fetch-Mode: navigate' -H $'Sec-Fetch-User: ?1' -H $'Sec-Fetch-Dest: document' -H $'Accept-Encoding: gzip, deflate' -H $'Accept-Language: en-GB,en-US;q=0.9,en;q=0.8' -H $'Connection: close' \
    $"https://c0sxbfi9ac.execute-api.ap-south-1.amazonaws.com/beta?url=https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/calendarByDistrict?district_id="$district_id"%26date="$date"")

out=$(echo $response | jq -r '.centers[] 
| .name as $name 
| .sessions[] 
| .min_age_limit as $min_age_limit 
| .available_capacity as $available_capacity 
| .date as $date 
| .vaccine as $vaccine 
| select($min_age_limit==18 and $available_capacity>0) 
| "\($date) - \($name) - \($available_capacity) \($vaccine) vaccines available. Min age -  \($min_age_limit)"')


echo "$out"	


#https://c0sxbfi9ac.execute-api.ap-south-1.amazonaws.com/beta?url=https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/calendarByDistrict?district_id=651%26date=12-05-2021
