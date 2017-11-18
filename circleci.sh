echo $1 $2 $3 $4 $5 $6
# $1 CircleCIToken
# $2 UserName
# $3 Project


curl -X POST --header "Content-Type: application/json" -d '{"name":"CLUSTER_LOCATION", "value":"westus2"}' https://circleci.com/api/v1.1/project/github/$2/$3/envvar?circle-token=$1
curl -X POST --header "Content-Type: application/json" -d '{"name":"CLUSTER_NAME", "value":"yourclustername"}' https://circleci.com/api/v1.1/project/github/$2/$3/envvar?circle-token=$1
curl -X POST --header "Content-Type: application/json" -d '{"name":"CONTAINER_REPOSITORY", "value":"your-repository"}' https://circleci.com/api/v1.1/project/github/$2/$3/envvar?circle-token=$1
curl -X POST --header "Content-Type: application/json" -d '{"name":"KEYUVAULT_NAME", "value":"np-team-keyvault-wus2"}' https://circleci.com/api/v1.1/project/github/$2/$3/envvar?circle-token=$1
curl -X POST --header "Content-Type: application/json" -d '{"name":"RESOURCE_GROUP", "value":"np-team-cluster-wus2-rg"}' https://circleci.com/api/v1.1/project/github/$2/$3/envvar?circle-token=$1
curl -X POST --header "Content-Type: application/json" -d '{"name":"SERVICE_PRINCIPAL", "value":"xxx"}' https://circleci.com/api/v1.1/project/github/$2/$3/envvar?circle-token=$1
curl -X POST --header "Content-Type: application/json" -d '{"name":"SERVICE_PRINCIPAL_PASS", "value":"xxx"}' https://circleci.com/api/v1.1/project/github/$2/$3/envvar?circle-token=$1
curl -X POST --header "Content-Type: application/json" -d '{"name":"SERVICE_TENANT", "value":"xxx"}' https://circleci.com/api/v1.1/project/github/$2/$3/envvar?circle-token=$1
