# resource "kubernetes_namespace" "sealed_secrets_ns" {
#   metadata {
#     name = "kube-system" 
#   }
# }

# # Deploy Sealed Secrets using the Helm chart
# resource "helm_release" "sealed_secrets_controller" {
#   name = "sealed-secrets" 
#   repository = "https://bitnami-labs.github.io/sealed-secrets" 
#   chart      = "sealed-secrets"                               
#   version    = "2.17.1"        
#   namespace  = "kube-system" 

#   depends_on = [
#     kubernetes_namespace.sealed_secrets_ns
#   ]
# }

# output "sealed_secrets_controller_status" {
#   description = "Status of the Sealed Secrets Helm release."
#   value       = helm_release.sealed_secrets_controller.status
# }

# output "sealed_secrets_controller_namespace" {
#   description = "Namespace where Sealed Secrets controller is deployed."
#   value       = helm_release.sealed_secrets_controller.namespace
# }
