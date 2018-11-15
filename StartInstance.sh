#!/bin/bash

set -eu

Id=`aws ec2 describe-instances | jq -r '.Reservations[].Instances[].InstanceId'`

aws ec2 start-instances --instance-ids $Id