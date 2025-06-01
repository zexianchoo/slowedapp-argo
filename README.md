# slowedapp-argo
helm repo add jetstack https://charts.jetstack.io --force-update
kind create cluster --config terraform/kind-config.yaml 
terraform -chdir=terraform/ apply -auto-approve
kubectl apply -f argo/application.yaml
kubectl apply -f argo/secrets.yaml
kubectl apply -f argo/argo-image-updater.yaml
login to argocd and it should be working

![Diagram](diagram.png)
