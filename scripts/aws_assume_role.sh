#!/bin/bash

role_arn="$1"
all_args=("$@")
aws_command=("${all_args[@]:1}")

credentials=$(aws sts assume-role --role-arn "$role_arn" --role-session-name script_session)

export AWS_ACCESS_KEY_ID="$(echo "$credentials" | jq -r ".Credentials.AccessKeyId")"
export AWS_SECRET_ACCESS_KEY="$(echo "$credentials" | jq -r ".Credentials.SecretAccessKey")"
export AWS_SESSION_TOKEN="$(echo "$credentials" | jq -r ".Credentials.SessionToken")"
export AWS_DEFAULT_REGION="eu-west-1"

${aws_command[@]}
