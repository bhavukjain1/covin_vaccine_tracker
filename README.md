# covin_vaccine_tracker

India's Co-Win vaccine slot tracker bot for telegram using bash. This will list down all the available vaccine slots till the next two weeks for people aged 18+.

# Usage

1. Install [jq](https://stedolan.github.io/jq/download/) to your machine.
2. If you're using linux, change the `gdate` to `date` in `covin_scheduler.sh` script. If using mac, install coreutils using brew - `brew install coreutils`
3. Give execution permissions to both the shell scripts:
```
chmod +x covin.sh
```
```
chmod +x covin_scheduler.sh
```
4. Run the `covin_scheduler.sh` shell script.

```
./covin_scheduler.sh city_id telegram_token telegram_chat_id
```
