if [ $# -gt 2 ]
then
   echo "Usage: $0 hostname [user]"
   exit 1
fi
host=${1}
user=${2:-ec2-user}
ssh -i $AWS_KEYPAIR_FILE $user@$host
