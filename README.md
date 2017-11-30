# create-tokens-variables-in-circle-ci

# Background story
Aiming to automate the process to set up a project in CircleCi with the right environment variables, we came up with the need to automate the creation of tokens in each of our github projects, hence this script:

# Usage
Supervised execution (stdin input for token, github handle and project name):
```
 sh circleci.sh
```

Set token and account settings ahead of time:
```
 sh circleci.sh -t yourCircleCiSecretToken -a yourGithubHandle -p yourGithubProject
```

Your variables will be in the `config.txt` in the shape of `VARIABLE_NAME|VALUE`. Put as many as you want! And leave one space behind so they script doesn't eat the first letter :burger:

# What's coming next:
1. Allow bitbuket integration  
