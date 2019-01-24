#! /bin/sh
#Get vault token using role_id
sleep 60
export ROLE_ID='1234'
export CLIENT_TOKEN=$(curl -sX POST -d '{"role_id":"'$ROLE_ID'"}' http://vault:8200/v1/auth/approle/login  | jq --raw-output ".auth.client_token")
curl --header "X-Vault-Token:$CLIENT_TOKEN" http://vault:8200/v1/database/creds/vault-mysql-role > credentials.json
export DB_USERNAME=$(cat credentials.json | jq --raw-output ".data.username")
export DB_PASSWORD=$(cat credentials.json | jq --raw-output ".data.password")

exec "$@"
