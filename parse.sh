#!/bin/bash

if [ -z "$1" ]; then
  echo "Target file name is missing!"
  exit 1
fi

# Load .env variables
if [ -f .env ]; then
  export $(cat .env | grep -v '#' | awk '/=/ {print $1}')
fi

lines=$(cat $1 \
  | grep -oP '\{{.*?\}}' \
  | grep -oP '\{\{\K[^\}\}]+'
)

sourceContent=$(cat $1)

for line in $lines
do
  vl=$(printenv $line)

  if [ ! -z "$vl" ]; then
    sourceContent=$(echo $sourceContent | sed "s/{{ $line }}/$vl/g")
  fi
done

echo $sourceContent
