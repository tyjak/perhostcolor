#!/bin/bash
# Set the term bg color based on string length
# 
# Usage :
#  perhostcolor.sh [string]
# 
# This script can be used in an alias
# TODO : could use ssh config, known host, etc

declare -a colors

# color palette
colors=( 002b36 222230 302222 222222 223022 303022 302230 223030 )

# solarized palette
#colors=( 002b36 073642 586e75 )

# ugly hack to enable usage of "perhostcolor $@" in aliases/script
input=`echo $@`
choice=${#input}


max=${#colors[@]}
while [ $choice -ge $max ] ; do
	choice=$(( choice - $max ))
done

resultingcolor=${colors[$choice]}

# rxvt /xterm escape sequence 
printf "\e]49;#$resultingcolor\a"
