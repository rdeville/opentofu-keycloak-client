# Client configuration
resource "keycloak_openid_client" "this" {
  enabled = var.enabled

  # Required variable
  realm_id    = var.realm_id
  client_id   = var.client_id
  access_type = var.access_type

  name        = var.name
  description = var.description

  client_secret                         = var.client_secret
  client_secret_regenerate_when_changed = var.client_secret_regenerate_when_changed
  client_secret_wo                      = var.client_secret_wo
  client_secret_wo_version              = var.client_secret_wo_version


  access_token_lifespan                          = var.access_token_lifespan
  admin_url                                      = var.admin_url
  allow_refresh_token_in_standard_token_exchange = var.allow_refresh_token_in_standard_token_exchange
  always_display_in_console                      = var.always_display_in_console
  backchannel_logout_revoke_offline_sessions     = var.backchannel_logout_revoke_offline_sessions
  backchannel_logout_session_required            = var.backchannel_logout_session_required
  backchannel_logout_url                         = var.backchannel_logout_url
  base_url                                       = var.base_url
  client_authenticator_type                      = var.client_authenticator_type
  client_offline_session_idle_timeout            = var.client_offline_session_idle_timeout
  client_offline_session_max_lifespan            = var.client_offline_session_max_lifespan
  client_session_idle_timeout                    = var.client_session_idle_timeout
  client_session_max_lifespan                    = var.client_session_max_lifespan
  consent_required                               = var.consent_required
  consent_screen_text                            = var.consent_screen_text
  display_on_consent_screen                      = var.display_on_consent_screen
  direct_access_grants_enabled                   = var.direct_access_grants_enabled
  exclude_issuer_from_auth_response              = var.exclude_issuer_from_auth_response
  exclude_session_state_from_auth_response       = var.exclude_session_state_from_auth_response
  frontchannel_logout_enabled                    = var.frontchannel_logout_enabled
  frontchannel_logout_url                        = var.frontchannel_logout_url
  full_scope_allowed                             = var.full_scope_allowed
  implicit_flow_enabled                          = var.implicit_flow_enabled
  login_theme                                    = var.login_theme
  oauth2_device_authorization_grant_enabled      = var.oauth2_device_authorization_grant_enabled
  oauth2_device_code_lifespan                    = var.oauth2_device_code_lifespan
  oauth2_device_polling_interval                 = var.oauth2_device_polling_interval
  pkce_code_challenge_method                     = var.pkce_code_challenge_method
  require_dpop_bound_tokens                      = var.require_dpop_bound_tokens
  root_url                                       = var.root_url
  service_accounts_enabled                       = var.service_accounts_enabled
  standard_flow_enabled                          = var.standard_flow_enabled
  standard_token_exchange_enabled                = var.standard_token_exchange_enabled
  use_refresh_tokens                             = var.use_refresh_tokens
  use_refresh_tokens_client_credentials          = var.use_refresh_tokens_client_credentials
  valid_post_logout_redirect_uris                = var.valid_post_logout_redirect_uris
  valid_redirect_uris                            = var.valid_redirect_uris
  web_origins                                    = var.web_origins

  extra_config = var.extra_config
  import       = var.import
}

# Client optional scopes configuration
resource "keycloak_openid_client_optional_scopes" "this" {
  realm_id        = var.realm_id
  client_id       = keycloak_openid_client.this.id
  optional_scopes = var.optional_scopes
}

# Client default scopes configuration
resource "keycloak_openid_client_default_scopes" "this" {
  realm_id       = var.realm_id
  client_id      = keycloak_openid_client.this.id
  default_scopes = var.default_scopes
}
