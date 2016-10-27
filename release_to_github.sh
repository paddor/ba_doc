#!/bin/bash 
 
echo "??? automatic release to github starting ???"
echo $1
echo $2
tagversion="$1"
export GITHUB_TOKEN="$2"

ghr "v.0.$1" main.pdf