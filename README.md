Simple EC2 Script Set - SESS
============================

Overview
--------
This project is a simple set of [bash](http://linux.die.net/man/1/bash) scripts to automate common AWS EC2 tasks.  The scripts make use of the 
[EC2 API Tools](https://aws.amazon.com/developertools/351) command line utilities to actually perform the EC2 operations.

These scripts probably aren't suitable for general use but they aren't all that specific to me either, hence I've made them available here.

The scripts are as follows:

* `aws-cp-to-servers.sh` - copy a specified file to the servers that `aws-list-servers.sh` lists (as the `ec2-user` unless otherwise specified)
* `aws-list-servers.sh` - list the servers that the current user owns, apart from those which are `terminated`
* `aws-term-servers.sh` - terminate all servers the current user owns (as returned by `aws-list-servers.sh`)
* `aws-create-servers.sh` - create "n" EC3 servers (of type "m1.small")
* `aws-ssh.sh` - creates an SSH session to the specified EC2 server
* `setenv.sh` - set up the environment variables that the scripts need

Setup
-----

* Create a directory to hold these utilities
* Clone this repo into the directory (git clone https://github.com/eoinwoods/sess.git)
* Download the [EC2 API Tools](https://aws.amazon.com/developertools/351) and unzip them into a subdirectory (something like `c2-api-tools-1.6.13.0`)
* Untar/unzip the scripts into the directory
* Update the `setenv.sh` to suit your environment
* Retrieve your AWS access key and AWS secret key from AWS and create a file `AWS-credentials.txt` file to hold them in this format:
```
    WS_ACCESS_KEY: AABBCCDDEEFF
    AWS_SECRET_KEY: nsusUshdSUSDHSJS+SKHD
```
* You can now run the utilities.  Start with `aws-list-servers.sh` to list your servers, then you can create, copy to, ssh to and destroy servers to your heart's content.



