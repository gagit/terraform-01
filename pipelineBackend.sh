sudo apt install unzip
curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
sudo apt-get install apt-transport-https --yes
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update


curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo apt-get install helm
sudo apt-get install jq -y
sudo apt install python3-pip -y

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client

eksctl create cluster --name eks-mundos-e --region us-east-2 --with-oidc --ssh-access --ssh-public-key jenkins2101 --managed
aws codecommit create-repository --repository-name eksworkshop-MundosE2101

aws iam create-user \--user-name <user_name>
aws iam attach-user-policy --user-name <user_name>  --policy-arn arn:aws:iam::aws:policy/AWSCodeCommitPowerUser
aws iam create-service-specific-credential --user-name <user_name> --service-name codecommit.amazonaws.com | tee /tmp/gituser_output.json

GIT_USERNAME=$(cat /tmp/gituser_output.json | jq -r '.ServiceSpecificCredential.ServiceUserName')
GIT_PASSWORD=$(cat /tmp/gituser_output.json | jq -r '.ServiceSpecificCredential.ServicePassword')
CREDENTIAL_ID=$(cat /tmp/gituser_output.json | jq -r '.ServiceSpecificCredential.ServiceSpecificCredentialId')

git clone codecommit::us-east-2://eksworkshop-MundosE2101


# [clonar repo de github]

eksctl create iam service account --name jenkins --namespace default --cluster eks-mundose-2101 --attach-policy-arn arn:aws:iam::aws:policy/AWSCodeCommitPowerUser --approve --override-existing-serviceaccounts

helm repo add jenkins https://charts.jenkins.io
helm repo update
helm install cicd jenkins/jenkins -f values.yaml
# Extraer el password de Jenkins
kubectl exec --namespace default -it svc/cicd-jenkins -c jenkins -- /bin/cat /run/secrets/chart-admin-password && echo

kubectl get pods -w
