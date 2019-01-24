#! /bin/sh
#Command to run

# Get IAM task role ARN from metadata, extract name of ARN, replace '-task-role' if found
#VAULT_PROJECT_NAME=$(curl -s 169.254.170.2$AWS_CONTAINER_CREDENTIALS_RELATIVE_URI |jq ".RoleArn"|cut -d / -f2|sed 's/

# Get app role/secret
#pip install awscli
#aws s3 cp s3://vault/$VAULT_PROJECT_NAME/credentials.json .

#ROLE_ID=$(cat credentials.json|jq ".role_id")
#Get vault token using role_id
sleep 60
export ROLE_ID='1234'
export CLIENT_TOKEN=$(curl -sX POST -d '{"role_id":"'$ROLE_ID'"}' http://vault:8200/v1/auth/approle/login  | jq --raw-output ".auth.client_token")
curl --header "X-Vault-Token:$CLIENT_TOKEN" http://vault:8200/v1/database/creds/vault-mysql-role > credentials.json
export DB_USERNAME=$(cat credentials.json | jq --raw-output ".data.username")
export DB_PASSWORD=$(cat credentials.json | jq --raw-output ".data.password")

exec "$@"
