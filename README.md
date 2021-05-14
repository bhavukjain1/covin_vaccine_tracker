# covin_vaccine_tracker

India's Co-Win vaccine slot tracker bot for telegram using bash. This will list down all the available vaccine slots till the next two weeks for people aged 18+.

Also, these scripts must run on Indian IP addresses as Co-win API is country restricted. If your VPS isn't Indian location based, either change the server location to India or create a proxy. The easiest way to create a proxy is by using AWS Lambda and API Gateway.

# Usage

1. Install [jq](https://stedolan.github.io/jq/download/) to your machine.
2. If you're using linux, change the `gdate` to `date` in `covin_scheduler.sh` script. If using mac, install coreutils using brew - `brew install coreutils`
3. Give execution permission to both the shell scripts:
```
chmod +x covin.sh
```
```
chmod +x covin_scheduler.sh
```
4. Run the `covin_scheduler.sh` shell script to send out alerts to telegram.

```
./covin_scheduler.sh city_id telegram_token telegram_chat_id
```

If you just want to print out the results, run the `covin.sh` shell script.

```
./covin.sh city_id date
```
Example:
```
./covin.sh 651 15-05-2021
```
