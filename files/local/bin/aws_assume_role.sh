#!/bin/bash

###############################################################################
# Script that assumes an AWS role and executes that command                   #
#                                                                             #
# Usage:                                                                      #
# aws_assume_role role_arn rest of aws command paramter                       #
#                                                                             #
###############################################################################

set -eou pipefail

role_arn="$1"
all_args=("$@")
aws_command=("${all_args[@]:1}")

credentials=$(aws sts assume-role --role-arn "$role_arn" --role-session-name script_session)

AWS_ACCESS_KEY_ID="$(echo "$credentials" | jq -r ".Credentials.AccessKeyId")"
AWS_SECRET_ACCESS_KEY="$(echo "$credentials" | jq -r ".Credentials.SecretAccessKey")"
AWS_SESSION_TOKEN="$(echo "$credentials" | jq -r ".Credentials.SessionToken")"
AWS_DEFAULT_REGION="eu-west-1"

export AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY
export AWS_SESSION_TOKEN
export AWS_DEFAULT_REGION

"${aws_command[@]}"
