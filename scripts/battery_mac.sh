#!/usr/bin/env bash

case $(uname -s) in
    "Darwin")
        ioreg -c AppleSmartBattery -w0 | \
        grep -o '"[^"]*" = [^ ]*' | \
        sed -e 's/= //g' -e 's/"//g' | \
        sort | \
        while read key value; do
            case $key in
                "MaxCapacity")
                    export maxcap=$value;;
                "CurrentCapacity")
                    export curcap=$value;;
                "ExternalConnected")
                    export extconnect=$value;;
            esac
            if [[ -n $maxcap && -n $curcap && -n $extconnect ]]; then
                if [[ "$curcap" == "$maxcap" ]]; then
                  echo "Charged"
                else
                  echo $(( 100 * $curcap / $maxcap ))"%"
                fi
                break
            fi
        done
esac
