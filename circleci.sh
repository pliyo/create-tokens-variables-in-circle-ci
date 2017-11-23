#!/bin/bash
set -euo pipefail


# Set all your variables in the key-value array below:
#declare -a variables
#variables['ABC']="value 123"
#variables['DEF']="value DEF"
variables="ABC=123 BCD=654"

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

for variable in $variables;
do
    
    set -- `echo $variable | tr '=' ' '`
    echo curl -X POST --header "Content-Type: application/json" -d "{\"name\":\"$1\", \"value\":\"$2\"}" $posturl

done

echo
if [ $?  == 0 ];
 then
	echo "Environment variables loaded successfully."
fi


