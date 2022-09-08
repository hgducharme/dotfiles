#!/bin/bash
hexchars="0123456789ABCDEF"
end=$( for i in {1..6} ; do echo -n ${hexchars:$(( $RANDOM % 16 )):1} ; done | sed -e 's/\(..\)/-\1/g' )
sudo ifconfig en0 lladdr 00-60-2F$end

