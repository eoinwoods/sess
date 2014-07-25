#!/bin/bash
scriptDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export EC2_HOME=${EC2_HOME:-$scriptDir/ec2-api-tools-1.6.13.0}
export PATH=$EC2_HOME/bin:$PATH
export AWS_ACCESS_KEY=$(cat AWS-credentials.txt | grep -v "^#" | grep AWS_ACCESS_KEY | cut -f2 -d:)
export AWS_SECRET_KEY=$(cat AWS-credentials.txt | grep -v "^#" | grep AWS_SECRET_KEY | cut -f2 -d:)
export AWS_GROUP=$(cat AWS-credentials.txt | grep -v "^#" | grep AWS_GROUP | cut -f2 -d:)
export AWS_GROUP=${AWS_GROUP:-default}
export AWS_KEYPAIR_FILE=${AWS_KEYPAIR_FILE:-$scriptDir/primary-key-pair.pem}
export EC2_URL=https://ec2.eu-west-1.amazonaws.com
export PATH=$scriptDir:$PATH

