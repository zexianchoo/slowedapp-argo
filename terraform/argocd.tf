resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  namespace  = "argocd"
  create_namespace = true
  version    = "8.0.9"

  values = [file("values.yaml")]
}


resource "helm_release" "argo_updater" {
  name = "updater"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argocd-image-updater"
  namespace = "argocd"

  create_namespace = true
  version = "0.12.1"
}