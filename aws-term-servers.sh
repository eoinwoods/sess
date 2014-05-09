if [ -z "$AWS_ACCESS_KEY" -o -z "$AWS_SECRET_KEY" ]
then
  echo "\$AWS_ACCESS_KEY and \$AWS_SECRET_KEY need to be set before running script"
  exit 1
fi
instance_ids=$(ec2-describe-instance-status | grep "INSTANCE[[:space:]]" | awk '{print $2}')
if [ -z "$instance_ids" ]
then
   echo "No instance IDs to terminate"
   exit 1
fi
ec2-terminate-instances $instance_ids
