#!/usr/bin/env bash

instance_name="$1"

if [ -z ${AWS_PROFILE+x} ]
then
  profile="$2"
else
  profile="$AWS_PROFILE"
fi

instance_id="$(\
    aws ec2 describe-instances \
        --profile "${profile}" \
        --filters \
            "Name=tag:Name,Values=*${instance_name}" \
            "Name=instance-state-name,Values=running" \
        --query "Reservations[0].Instances[0].InstanceId" \
        --region "eu-west-1" \
        --output text \
)"

if [[ $? -eq 0 ]] && [[ -n "${instance_id}" ]] && [[ "${instance_id}" != "None" ]] ; then
    aws ssm start-session --profile "${profile}" --target "${instance_id}" --region "eu-west-1"
fi
