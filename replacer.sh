#!/bin/bash
FILE_NAME=""
ENV_STRING=""
COMMAND=""
while read line; do
	if [ "$FILE_NAME" == "" ]; then
		FILE_NAME=$line
		echo "File Name = $FILE_NAME"
	elif [ "$line" != "---" ]; then
		ENV_STRING="$ENV_STRING $line"
		echo "env_vars = $ENV_STRING"
	fi

	if [ "$line" == "---" ]; then
		COMMAND="$ENV_STRING envsubst < $FILE_NAME > file.tmp && mv file.tmp ./target/$FILE_NAME"
		echo "$COMMAND"
		eval "$COMMAND"
		FILE_NAME=""
		ENV_STRING=""
		COMMAND=""
	fi
done < $1

