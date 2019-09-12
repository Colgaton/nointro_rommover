#!/bin/bash 

# v1.0
# Only works for noIntro roms format.
# $1 source folder
# $2 dest folder
# extension - file extension to check
#
# This tool will move only the preferred roms to the
# destionation folder, so you don't keep roms with
# multiple regions.

# It's a quick hack, make sure the folders exists
# before running it...

folder=$1
newfolder=$2
extension=gg

if [ $# -lt 2 ]
  then
    echo "Missing arguments..."
    exit
fi

ls $1 | while read i; do
	romname=$(echo "${i}" | sed -e "s/ (.*).$extension//g")

	if [ "$romname" = "$previousrom" ]; then
		continue
	fi

	if [ -e "$folder/$romname (World).$extension" ]; then
		#echo 'World Rom found'
		mv "$folder/$romname (World).$extension" $newfolder/
	elif [ -e "$folder/$romname (US - EU).$extension" ]; then
		#echo 'US-EU Rom found'
		mv "$folder/$romname (US - EU).$extension" $newfolder/
	elif [ -e "$folder/$romname (US).$extension" ]; then
		#echo 'US Rom found'
		mv "$folder/$romname (US).$extension" $newfolder/
	elif [ -e "$folder/$romname (BR).$extension" ]; then
		#echo 'BR Rom found'
		mv "$folder/$romname (BR).$extension" $newfolder/
	elif [ -e "$folder/$romname (JP).$extension" ]; then
		#echo 'JP Rom found'
		mv "$folder/$romname (JP).$extension" $newfolder/
	elif [ -e "$folder/$romname (EU).$extension" ]; then
		#echo 'EU Rom found'
		mv "$folder/$romname (EU).$extension" $newfolder/
	elif [ -e "$folder/$romname (KO).$extension" ]; then
		#echo 'KO Rom found'
		mv "$folder/$romname (KO).$extension" $newfolder/
	elif [ -e "$folder/$romname (JP - KO).$extension" ]; then
		#echo 'JP - KO Rom found'
		mv "$folder/$romname (JP - KO).$extension" $newfolder/
	elif [ -e "$folder/$romname (JP - US).$extension" ]; then
		#echo 'JP - US Rom found'
		mv "$folder/$romname (JP - US).$extension" $newfolder/
	else [ echo "$romname....something is wrong..." ]
	fi
	
	previousrom="$romname"
done

