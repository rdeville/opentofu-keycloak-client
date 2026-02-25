output "this" {
  value       = keycloak_openid_client.this
  description = "ID of the deployed client"
}

output "client_roles" {
  value       = keycloak_role.this
  description = "ID of the deployed client"
}
