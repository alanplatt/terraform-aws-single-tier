# terraform-aws-single-tier
Simple single tier aws example

![terraform-aws-single-tier-diagram](https://www.gliffy.com/go/publish/image/10692371/L.png)

## AWS credentials setup
```
cat > ~/.aws/credentials << EOF
[default]
aws_access_key_id='some_id'
aws_secret_access_key='some_key'
EOF
```

## ssh key
Within the configs we refer to a ssh rsa key by the name of 'id_rsa_aws_1'.
This will need to be generated using the ssh-keygen command.  Once generated this key needs to be
loaded into an ssh-agent.  The reason for this is that we use the remote-exec provisioner which is part
of terraform to run commands remotely over ssh and that needs this key to authenticate. This process will
generate a public and private key. The public key is what is refered to in the variables file and is
copied to the instances.

```
$ ssh-keygen #follow the intructions making sure you name the key the same as below

# These two steps are required each time you open a new terminal
$ eval $(ssh-agent) #run the ssh agent
$ ssh-add ~/.ssh/id_rsa_aws_1
```
