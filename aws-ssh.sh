if [ $# -gt 2 ]
then
   echo "Usage: $0 [hostname [user]]"
   exit 1
fi
host=${1:-eoinvm1.uk.to}
user=${2:-ec2-user}
ssh -i primary-key-pair.pem $user@$host
