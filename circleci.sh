#!/bin/bash
set -euo pipefail

usage() { echo "Usage: $0 -t <circleCiToken> -a <githubAccountName> -p <projectName>" 1>&2; exit 1; }

declare circleCiToken=""
declare githubAccountName=""
declare projectName=""

# Initialize parameters specified from command line
while getopts ":t:a:p:" arg; do
	case "${arg}" in
		t)
			circleCiToken=${OPTARG}
			;;
		a)
			githubAccountName=${OPTARG}
			;;
		p)
			projectName=${OPTARG}
			;;
		esac
done
shift $((OPTIND-1))

#Prompt for parameters if some required parameters are missing
if [[ -z "$circleCiToken" ]]; then
	echo "Circle CI Token:"
	read circleCiToken
	[[ "${circleCiToken:?}" ]]
fi

if [[ -z "$githubAccountName" ]]; then
        echo "Github Account Name:"
        read githubAccountName
        [[ "${githubAccountName:?}" ]]
fi

if [[ -z "$projectName" ]]; then
        echo "Project Name:"
        read projectName
        [[ "${projectName:?}" ]]
fi


posturl="https://circleci.com/api/v1.1/project/github/$githubAccountName/$projectName/envvar?circle-token=$circleCiToken"

echo "Loading environment variables into project $githubAccountName/$projectName:"

# Iterate through your variables in config.txt and upload them to circle ci
# They need to be in the shape of "VARIABLE_NAME|VALUE"
IFS="|"
while read -r name value
do
curl -X POST --header "Content-Type: application/json" -d "{\"name\":\"$name\", \"value\":\"$value\"}" $posturl
done < config.txt

echo
if [ $?  == 0 ];
 then
	echo "Environment variables loaded successfully."
fi


