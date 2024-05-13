#!/bin/bash

URL=wtpersonal.stream
LOCATION="$URL"/vault/pwcode.asc

function decrypt() {
	local filename=$1

	if [[ -z "$filename" ]]; then
		curl "$LOCATION" | gpg --decrypt --armor 2>/dev/null
	else
		curl "$LOCATION" | gpg --decrypt --output "$filename" --armor
		echo "Decrypt, save to $filename"
	fi
}

decrypt $1