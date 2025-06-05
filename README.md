# slowedapp-argo
helm repo add argo https://argoproj.github.io/argo-helm --force-update
helm repo add jetstack https://charts.jetstack.io --force-update
k3d cluster create --config terraform/k3d-config.yaml
terraform -chdir=terraform/ init
terraform -chdir=terraform/ apply -auto-approve
kubectl apply -f argo/application.yaml
kubectl apply -f argo/secrets.yaml
login to argocd and it should be working

sudo cp /root/slowedapp/slowedapp-argo/nginx/reverse_proxy.conf /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/reverse_proxy.conf /etc/nginx/sites-enabled/
ensure cloudflare certs are correctly refed.

sudo ufw allow 'Nginx Full'
sudo ufw enable            
sudo systemctl enable nginx
![Diagram](diagram.png)
