if [ -z "$1" ] 
then
   count=1
else
   count=$1
fi
if [ -z "$AWS_ACCESS_KEY" -o -z "$AWS_SECRET_KEY" ]
then
  echo "\$AWS_ACCESS_KEY and \$AWS_SECRET_KEY need to be set before running script"
  exit 1 
fi
echo "Creating $count instances"
export AMI_ID=ami-a921dfde
export TYPE=m1.small
export COUNT=$count
export GROUP=CopseGroup
ec2-run-instances $AMI_ID \
        --instance-type $TYPE \
	--key primary-key-pair \
	--group "$GROUP" \
  	--region eu-west-1 \
	--instance-count $COUNT

