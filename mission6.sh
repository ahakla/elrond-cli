#!/bin/bash

number_of_wallets="$(ls -ld $HOME/nodewallets/*.pem | wc -l)"

# Continuously send transactions between start and end time
mission_start_timestamp=1577098800      # Mon 23 Dec 2019 11:00 UTC
mission_end_timestamp=1577102700        # Mon 23 Dec 2019 12:05 UTC
timestamp=$(date -u +%s)

while [ $timestamp -ge $mission_start_timestamp -a $timestamp -le $mission_end_timestamp ]; do

for i in $( seq 0 $((number_of_wallets - 1)) ); do

        # Put the receiving wallet addresses of your favorite articles here
        # This script will only use the first number_of_wallets addresses
        # The rest will be disregarded, don't worry!
        # In this example, all receiving wallets are set to the article's wallet of Alwin ;)
        # Please change the wallets to send the ERD to your favorite article's wallets!
        case $i in
                0)
                        receiving_wallet="79292c74c4d7922bbfd99b165d44f81b86db894c2ec9cff6d32b7b11708a5416"
                        ;;
                1)
                        receiving_wallet="79292c74c4d7922bbfd99b165d44f81b86db894c2ec9cff6d32b7b11708a5416"
                        ;;
                2)
                        receiving_wallet="79292c74c4d7922bbfd99b165d44f81b86db894c2ec9cff6d32b7b11708a5416"
                        ;;
                3)
                        receiving_wallet="79292c74c4d7922bbfd99b165d44f81b86db894c2ec9cff6d32b7b11708a5416"
                        ;;
                4)
                        receiving_wallet="79292c74c4d7922bbfd99b165d44f81b86db894c2ec9cff6d32b7b11708a5416"
                        ;;
                5)
                        receiving_wallet="79292c74c4d7922bbfd99b165d44f81b86db894c2ec9cff6d32b7b11708a5416"
                        ;;
                6)
                        receiving_wallet="79292c74c4d7922bbfd99b165d44f81b86db894c2ec9cff6d32b7b11708a5416"
                        ;;
                7)
                        receiving_wallet="79292c74c4d7922bbfd99b165d44f81b86db894c2ec9cff6d32b7b11708a5416"
                        ;;
                8)
                        receiving_wallet="79292c74c4d7922bbfd99b165d44f81b86db894c2ec9cff6d32b7b11708a5416"
                        ;;
                9)
                        receiving_wallet="79292c74c4d7922bbfd99b165d44f81b86db894c2ec9cff6d32b7b11708a5416"
                        ;;
        esac

        contents_initialBalancesSk=$(<"$HOME/nodewallets/node-$i.pem")
        wallet_address="${contents_initialBalancesSk:27:64}"
        balance="$(./erd balance $wallet_address | awk 'NF>1{print $NF}')"

        if [[ $balance > 10 ]]; then
                ./erd transfer --wallet $HOME/nodewallets/node-$i.pem --to $receiving_wallet --amount $((balance-10))
        fi
done

timestamp=$(date -u +%s)

done
