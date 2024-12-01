#!/bin/bash

set -e
set +x

secret_arn=$(awslocal secretsmanager list-secrets | jq -rc '.SecretList[0].ARN')
old_value=$(awslocal secretsmanager get-secret-value --secret-id $secret_arn | jq -rc '.SecretString')
echo "old value: $old_value"
new_password="Rando$(date +%Y%m%d%H%M%S)"
new_value="{\"name\":\"user\",\"database\":\"placeholder_db\",\"password\":\"$new_password\"}"
awslocal secretsmanager update-secret --secret-id $secret_arn --secret-string $new_value
fetched_value=$(awslocal secretsmanager get-secret-value --secret-id $secret_arn | jq -rc '.SecretString')
echo "new value: $fetched_value"