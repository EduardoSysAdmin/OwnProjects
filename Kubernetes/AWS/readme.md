# Steps & commands to AWS cluster deploy:

Download kops (suite tools to manage cloud cluster):
curl -LO https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64

Install AWS tool:
pip install awscli

Configure an acces pair key in your AWS acc

Set your keys with the interactive command:
aws configure

Create bucket (bucket is where your metadata is gonna be saved):
aws s3api create-bucket --bucket eog-demo-k8s-bucket --region eu-west-3 --create-bucket-configuration=LocationConstraint=eu-west-3

Declare as a environment variable your bucket name:
echo "export KOPS_STATE_STORE=s3://eog-demo-k8s-bucket" >> ~/.bashrc

Create a cluster deployment:
kops create cluster eog-demo-bucket.k8s.local --zones eu-west-2a,eu-west-2b,eu-west,eu-west-2c --node-count 3 --master-zones eu-west-2a,eu-west-2b,eu-west,eu-west-2c --yes

Check cluster status. This may needs a few minutes:
kops validate cluster

When you are done, clear it if you want:
kops delete cluster eog-demo-bucket.k8s.local
