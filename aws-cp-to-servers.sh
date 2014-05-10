if [ -z "$1" ]
then
   echo "Usage $0 filename"
   exit 1
fi
if [ -z "$AWS_ACCESS_KEY" -o -z "$AWS_SECRET_KEY" ]
then
  echo "\$AWS_ACCESS_KEY and \$AWS_SECRET_KEY need to be set before running script"
  exit 1 
fi

files=$*
instance_ids=$(ec2-describe-instance-status | grep "INSTANCE[[:space:]]" | awk '{print $2}')
for i in $instance_ids
do
    dns_name=$(ec2-describe-instances $i | grep INSTANCE | awk '{print $4}')
    cmd="scp -i AWS_KEYPAIR_FILE $files ec2-user@$dns_name:."
    echo $cmd
    eval $cmd
done

