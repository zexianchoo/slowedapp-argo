# slowedapp-argo
helm repo add argo https://argoproj.github.io/argo-helm --force-update
helm repo add jetstack https://charts.jetstack.io --force-update
k3d cluster create --config terraform/k3d-config.yaml
terraform -chdir=terraform/ init
terraform -chdir=terraform/ apply -auto-approve
kubectl apply -f argo/application.yaml
kubectl apply -f argo/secrets.yaml
login to argocd and it should be working

![Diagram](diagram.png)
