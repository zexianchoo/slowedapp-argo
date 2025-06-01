resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  namespace  = "argocd"
  create_namespace = true
  version    = "8.0.9"

  values = [file("values/argo_values.yaml")]
}

resource "helm_release" "argo_updater" {
  name = "updater"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argocd-image-updater"
  namespace = "argocd"

  create_namespace = true
  version = "0.12.1"
  values = [file("values/updater_values.yaml")]
}

# cert manager terraform
resource "helm_release" "cert_manager" {
  name = "cert-manager"
  namespace        = "cert-manager"
  create_namespace = true

  chart = "jetstack/cert-manager"
  version = "v1.14.5"
  set {
    name  = "installCRDs"
    value = "true"
    type  = "string" 
  }

  wait = true
}