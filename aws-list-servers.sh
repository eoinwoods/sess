if [ -z "$AWS_ACCESS_KEY" -o -z "$AWS_SECRET_KEY" ]
then
  echo "\$AWS_ACCESS_KEY and \$AWS_SECRET_KEY need to be set before running script"
  exit 1 
fi

instance_ids=$(ec2-describe-instance-status | grep "INSTANCE[[:space:]]" | awk '{print $2}')
for i in $instance_ids
do
    instStat=$(ec2-describe-instance-status $i | grep "INSTANCE[[:space:]]")
    inst=$(ec2-describe-instances $i | grep INSTANCE)
    instance_state=$(echo $instStat | awk '{print $4}')
    status=$(echo $instStat | awk '{print $6}')
    ami_id=$(echo $inst | awk '{print $3}')
    dns_name=$(echo $inst | awk '{print $4}')
    type=$(echo $inst | awk '{print $9}')

    echo "$i $instance_state $status (AMI $ami_id $dns_name $type)"
done

