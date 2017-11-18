# create-tokens-variables-in-circle-ci

#Background story
Aiming to provision multiple Azure Kubernetes Clusters using CircleCi, we came up with the need to automate the creation of tokens in each of our github projects, hence this script:

# Usage
```
 sh circleci.sh yourCircleCiSecretToken yourGithubHandle yourGithubProject
```

In V.1 you'll need to change the name of the parameters yourself in the code!

# What's coming next:
The idea is to provide this set of token-values in a json, iterate over them, and send them as needed.
