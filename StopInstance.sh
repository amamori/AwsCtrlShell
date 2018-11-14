#!/bin/bash

set -eu

Id=`aws ec2 describe-instance-status | jq -r '.InstanceStatuses[].InstanceId'`
Status=`aws ec2 describe-instance-status | jq -r '.InstanceStatuses[].InstanceState.Name'`

if [ -n "$Id" -a $Status="running" ]; then
	aws ec2 stop-instances --instance-ids $Id
else
	echo "起動なし"
fi
