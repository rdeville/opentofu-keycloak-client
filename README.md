<!-- markdownlint-disable -->

# 👋 Welcome to OpenTofu Module Gitlab User

<center>

> ⚠️ IMPORTANT !
>
> Main repo is on [framagit.org](https://framagit.org/rdeville-public/opentofu/gitlab-user).
>
> On other online git platforms, they are just mirror of the main repo.
>
> Any issues, pull/merge requests, etc., might not be considered on those other
> platforms.

</center>

---

<center>

[![Licenses: (MIT OR BEERWARE)][license_badge]][license_url]
[![Changelog][changelog_badge]][changelog_badge_url]
[![Release][release_badge]][release_badge_url]

</center>

[release_badge]: https://framagit.org/rdeville-public/opentofu/gitlab-user/-/badges/release.svg
[release_badge_url]: https://framagit.org/rdeville-public/opentofu/gitlab-user/-/releases/
[license_badge]: https://img.shields.io/badge/Licenses-MIT%20OR%20BEERWARE-blue
[license_url]: https://framagit.org/rdeville-public/opentofu/gitlab-user/blob/main/LICENSE
[changelog_badge]: https://img.shields.io/badge/Changelog-Python%20Semantic%20Release-yellow
[changelog_badge_url]: https://github.com/python-semantic-release/python-semantic-release

OpenTofu modules allowing to manage gitlab user configuration.

---

## 🚀 Usage

### Minimal Configuration

Deploy an OpenID client with only the required variables:

```hcl
module "keycloak_client" {
  source = "git::https://framagit.org/rdeville-public/opentofu/keycloak-client.git"

  # Required variables
  realm_id  = "my-realm"
  client_id = "my-client"
}
```

### Full Configuration with Defaults

Deploy an OpenID client explicitly setting all optional variables to their default values:

```hcl
module "keycloak_client" {
  source = "git::https://framagit.org/rdeville-public/opentofu/keycloak-client.git"

  # Required variables
  realm_id  = "my-realm"
  client_id = "my-client"

  # Optional variables with default values
  enabled                                        = true
  name                                           = ""
  description                                    = ""
  access_type                                    = "CONFIDENTIAL"
  client_secret                                  = null
  client_secret_wo                               = null
  client_secret_wo_version                       = null
  client_secret_regenerate_when_changed          = {}
  client_authenticator_type                      = "client-secret"
  standard_flow_enabled                          = false
  implicit_flow_enabled                          = false
  direct_access_grants_enabled                   = false
  service_accounts_enabled                       = false
  frontchannel_logout_enabled                    = false
  frontchannel_logout_url                        = ""
  valid_redirect_uris                            = []
  valid_post_logout_redirect_uris                = []
  web_origins                                    = []
  root_url                                       = ""
  admin_url                                      = ""
  base_url                                       = ""
  pkce_code_challenge_method                     = ""
  require_dpop_bound_tokens                      = false
  full_scope_allowed                             = true
  access_token_lifespan                          = ""
  client_offline_session_idle_timeout            = ""
  client_offline_session_max_lifespan            = ""
  client_session_idle_timeout                    = ""
  client_session_max_lifespan                    = ""
  consent_required                               = true
  display_on_consent_screen                      = true
  consent_screen_text                            = ""
  login_theme                                    = ""
  exclude_session_state_from_auth_response       = false
  exclude_issuer_from_auth_response              = null
  use_refresh_tokens                             = true
  use_refresh_tokens_client_credentials          = false
  standard_token_exchange_enabled                = false
  allow_refresh_token_in_standard_token_exchange = "NO"
  oauth2_device_authorization_grant_enabled      = null
  oauth2_device_code_lifespan                    = ""
  oauth2_device_polling_interval                 = ""
  backchannel_logout_url                         = ""
  backchannel_logout_session_required            = true
  backchannel_logout_revoke_offline_sessions     = false
  always_display_in_console                      = false
  extra_config                                   = {}

  import = false
}
```

### Optional Scopes

Deploy an OpenID client with optional scopes:

```hcl
module "keycloak_client" {
  source = "git::https://framagit.org/rdeville-public/opentofu/keycloak-client.git"

  # Required variables
  realm_id         = "my-realm"
  client_id        = "my-client"

  # Optional variables
  optional_scopes  = [
    "email",
    "phone",
    "address",
  ]
}
```

### Default Scopes

Deploy an OpenID client with default scopes:

```hcl
module "keycloak_client" {
  source = "git::https://framagit.org/public/opentofu/keycloak-client.git"

  # Required variables
  realm_id       = "my-realm"
  client_id      = "my-client"

  # Optional variables
  default_scopes = [
    "openid",
    "profile",
    "email",
  ]
}
```

### Realm Roles

Deploy an OpenID client with realm roles assigned to its service account:

```hcl
module "keycloak_client" {
  source = "git::https://framagit.org/rdeville-public/opentofu/keycloak-client.git"

  # Required variables
  realm_id  = "my-realm"
  client_id = "my-client"

  # Enable service accounts to assign realm roles
  service_accounts_enabled = true

  # Assign realm roles to the service account
  realm_roles = [
    "my-realm-role-1",
    "my-realm-role-2",
  ]
}
```

<!-- BEGIN TF-DOCS -->
## ⚙️ Module Content

<details><summary>Click to reveal</summary>

### Table of Content

* [Requirements](#requirements)
* [Resources](#resources)
* [Inputs](#inputs)
  * [Required Inputs](#required-inputs)
  * [Optional Inputs](#optional-inputs)
* [Outputs](#outputs)

### Requirements

* [opentofu](https://opentofu.org/docs/):
  `>= 1.8, < 2.0`
* [keycloak](https://search.opentofu.org/provider/keycloak/keycloak/):
  `~>5.6`

### Resources

* [resource.keycloak_openid_client.this](https://registry.terraform.io/providers/keycloak/keycloak/latest/docs/resources/openid_client)
  > Client configuration
* [resource.keycloak_openid_client_default_scopes.this](https://registry.terraform.io/providers/keycloak/keycloak/latest/docs/resources/openid_client_default_scopes)
  > Client default scopes configuration
* [resource.keycloak_openid_client_optional_scopes.this](https://registry.terraform.io/providers/keycloak/keycloak/latest/docs/resources/openid_client_optional_scopes)
  > Client optional scopes configuration
* [resource.keycloak_openid_client_service_account_realm_role.this](https://registry.terraform.io/providers/keycloak/keycloak/latest/docs/resources/openid_client_service_account_realm_role)
  >

<!-- markdownlint-capture -->
### Inputs

<!-- markdownlint-disable -->
#### Required Inputs

* [realm_id](#realm_id)
* [client_id](#client_id)

##### `realm_id`

The realm this client is attached to.

<div style="display:inline-block;width:100%;">
<div style="float:left;border-color:#FFFFFF;width:75%;">
<details><summary>Type</summary>

```hcl
string
```

</details>
</div>
</div>

##### `client_id`

The Client ID for this client, referenced in the URI during authentication and
in issued tokens.

<div style="display:inline-block;width:100%;">
<div style="float:left;border-color:#FFFFFF;width:75%;">
<details><summary>Type</summary>

```hcl
string
```

</details>
</div>
</div>

#### Optional Inputs

* [enabled](#enabled)
* [name](#name)
* [description](#description)
* [access_type](#access_type)
* [client_secret](#client_secret)
* [client_secret_wo](#client_secret_wo)
* [client_secret_wo_version](#client_secret_wo_version)
* [client_secret_regenerate_when_changed](#client_secret_regenerate_when_changed)
* [client_authenticator_type](#client_authenticator_type)
* [standard_flow_enabled](#standard_flow_enabled)
* [implicit_flow_enabled](#implicit_flow_enabled)
* [direct_access_grants_enabled](#direct_access_grants_enabled)
* [service_accounts_enabled](#service_accounts_enabled)
* [frontchannel_logout_enabled](#frontchannel_logout_enabled)
* [frontchannel_logout_url](#frontchannel_logout_url)
* [valid_redirect_uris](#valid_redirect_uris)
* [valid_post_logout_redirect_uris](#valid_post_logout_redirect_uris)
* [web_origins](#web_origins)
* [root_url](#root_url)
* [admin_url](#admin_url)
* [base_url](#base_url)
* [pkce_code_challenge_method](#pkce_code_challenge_method)
* [require_dpop_bound_tokens](#require_dpop_bound_tokens)
* [full_scope_allowed](#full_scope_allowed)
* [access_token_lifespan](#access_token_lifespan)
* [client_offline_session_idle_timeout](#client_offline_session_idle_timeout)
* [client_offline_session_max_lifespan](#client_offline_session_max_lifespan)
* [client_session_idle_timeout](#client_session_idle_timeout)
* [client_session_max_lifespan](#client_session_max_lifespan)
* [consent_required](#consent_required)
* [display_on_consent_screen](#display_on_consent_screen)
* [consent_screen_text](#consent_screen_text)
* [login_theme](#login_theme)
* [exclude_session_state_from_auth_response](#exclude_session_state_from_auth_response)
* [exclude_issuer_from_auth_response](#exclude_issuer_from_auth_response)
* [use_refresh_tokens](#use_refresh_tokens)
* [use_refresh_tokens_client_credentials](#use_refresh_tokens_client_credentials)
* [standard_token_exchange_enabled](#standard_token_exchange_enabled)
* [allow_refresh_token_in_standard_token_exchange](#allow_refresh_token_in_standard_token_exchange)
* [oauth2_device_authorization_grant_enabled](#oauth2_device_authorization_grant_enabled)
* [oauth2_device_code_lifespan](#oauth2_device_code_lifespan)
* [oauth2_device_polling_interval](#oauth2_device_polling_interval)
* [backchannel_logout_url](#backchannel_logout_url)
* [backchannel_logout_session_required](#backchannel_logout_session_required)
* [backchannel_logout_revoke_offline_sessions](#backchannel_logout_revoke_offline_sessions)
* [always_display_in_console](#always_display_in_console)
* [extra_config](#extra_config)
* [import](#import)
* [default_scopes](#default_scopes)
* [optional_scopes](#optional_scopes)
* [realm_roles](#realm_roles)


##### `enabled`

When false, this client will not be able to initiate a login or obtain access
tokens. Defaults to true.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  true
  ```

  </div>
</details>

##### `name`

The display name of this client in the GUI.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  ""
  ```

  </div>
</details>

##### `description`

The description of this client in the GUI.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  ""
  ```

  </div>
</details>

##### `access_type`

Required, Specifies the type of client, which can be one of the following:
* `CONFIDENTIAL`: Used for server-side clients that require both client ID and
  secret when authenticating. This client should be used for applications
  using the Authorization Code or Client Credentials grant flows.
* `PUBLIC`: Used for browser-only applications that do not require a client
  secret, and instead rely only on authorized redirect URIs for security. This
  client should be used for applications using the Implicit grant flow.
* `BEARER-ONLY`: Used for services that never initiate a login. This client
  will only allow bearer token requests.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  CONFIDENTIAL
  ```

  </div>
</details>

##### `client_secret`

The secret for clients with an access_type of CONFIDENTIAL or BEARER-ONLY.
This value is sensitive and should be treated with the same care as a
password. If omitted, this will be generated by Keycloak.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  null
  ```

  </div>
</details>

##### `client_secret_wo`

Write-Only, the secret for clients with an access_type of CONFIDENTIAL or
BEARER-ONLY. This is a write-only argument and Terraform does not store them
in state or plan files. If omitted, this will fallback to use client_secret.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  null
  ```

  </div>
</details>

##### `client_secret_wo_version`

Functions as a flag and/or trigger to indicate Terraform when to use the input
value in client_secret_wo to execute a Create or Update operation. The value
of this argument is stored in the state and plan files. Required when using
client_secret_wo.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  number
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  null
  ```

  </div>
</details>

##### `client_secret_regenerate_when_changed`

Arbitrary map of values that, when changed, will trigger rotation of the
secret.
NOTE! Conflicts with client_secret, client_secret_wo and
client_secret_wo_version attribute and can't be used together

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  map(string)
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  {}
  ```

  </div>
</details>

##### `client_authenticator_type`

Defaults to client-secret. The authenticator type for clients with an access_type of CONFIDENTIAL or BEARER-ONLY. A default Keycloak installation will have the following available types:
* `client-secret`: (Default) Use client id and client secret to authenticate
  client.
* `client-jwt`: Use signed JWT to authenticate client. Set signing algorithm in
  extra_config with attributes.token.endpoint.auth.signing.alg = <alg>
* `client-x509`: Use x509 certificate to authenticate client. Set Subject DN in
  extra_config with attributes.x509.subjectdn = <subjectDn>
* `client-secret-jwt`: Use signed JWT with client secret to authenticate
  client. Set signing algorithm in extra_config with
  attributes.token.endpoint.auth.signing.alg = <alg>

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  client-secret
  ```

  </div>
</details>

##### `standard_flow_enabled`

When true, the OAuth2 Authorization Code Grant will be enabled for this
client.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `implicit_flow_enabled`

When true, the OAuth2 Implicit Grant will be enabled for this client.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `direct_access_grants_enabled`

When true, the OAuth2 Resource Owner Password Grant will be enabled for this
client.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `service_accounts_enabled`

When true, the OAuth2 Client Credentials grant will be enabled for this
client.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `frontchannel_logout_enabled`

When true, frontchannel logout will be enabled for this client. Specify the
url with frontchannel_logout_url.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `frontchannel_logout_url`

Optional, The frontchannel logout url.
This is applicable only when frontchannel_logout_enabled is true.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  ""
  ```

  </div>
</details>

##### `valid_redirect_uris`

A list of valid URIs a browser is permitted to redirect to after a successful
login or logout. Simple wildcards in the form of an asterisk can be used here.
This attribute must be set if either standard_flow_enabled or
implicit_flow_enabled is set to true.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  list(string)
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  []
  ```

  </div>
</details>

##### `valid_post_logout_redirect_uris`

A list of valid URIs a browser is permitted to redirect to after a successful
logout.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  list(string)
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  []
  ```

  </div>
</details>

##### `web_origins`

A list of allowed CORS origins. To permit all valid redirect URIs, add +. Note
that this will not include the * wildcard. To permit all origins, explicitly
add *.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  list(string)
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  []
  ```

  </div>
</details>

##### `root_url`

When specified, this URL is prepended to any relative URLs found within
valid_redirect_uris, web_origins, and admin_url. NOTE: Due to limitations in
the Keycloak API, when the root_url attribute is used, the
valid_redirect_uris, web_origins, and admin_url attributes will be required.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  ""
  ```

  </div>
</details>

##### `admin_url`

URL to the admin interface of the client.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  ""
  ```

  </div>
</details>

##### `base_url`

Default URL to use when the auth server needs to redirect or link back to the client.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  ""
  ```

  </div>
</details>

##### `pkce_code_challenge_method`

The challenge method to use for Proof Key for Code Exchange. Can be either
plain or S256 or set to empty value ``.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  ""
  ```

  </div>
</details>

##### `require_dpop_bound_tokens`

Enable support for Demonstrating Proof-of-Possession (DPoP, bound tokens).

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `full_scope_allowed`

Allow to include all roles mappings in the access token.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  true
  ```

  </div>
</details>

##### `access_token_lifespan`

The amount of time in seconds before an access token expires. This will
override the default for the realm.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  ""
  ```

  </div>
</details>

##### `client_offline_session_idle_timeout`

Time a client session is allowed to be idle before it expires. Tokens are
invalidated when a client session is expired. If not set it uses the standard
SSO Session Idle value.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  ""
  ```

  </div>
</details>

##### `client_offline_session_max_lifespan`

Max time before a client session is expired. Tokens are invalidated when a
client session is expired. If not set, it uses the standard SSO Session Max
value.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  ""
  ```

  </div>
</details>

##### `client_session_idle_timeout`

Time a client offline session is allowed to be idle before it expires. Offline
tokens are invalidated when a client offline session is expired. If not set it
uses the Offline Session Idle value.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  ""
  ```

  </div>
</details>

##### `client_session_max_lifespan`

Max time before a client offline session is expired. Offline tokens are
invalidated when a client offline session is expired. If not set, it uses the
Offline Session Max value.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  ""
  ```

  </div>
</details>

##### `consent_required`

When true, users have to consent to client access.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  true
  ```

  </div>
</details>

##### `display_on_consent_screen`

When true, the consent screen will display information about the client
itself.
This is applicable only when consent_required is true.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  true
  ```

  </div>
</details>

##### `consent_screen_text`

The text to display on the consent screen about permissions specific to this
client.
This is applicable only when display_on_consent_screen is true.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  ""
  ```

  </div>
</details>

##### `login_theme`

The client login theme. This will override the default theme for the realm.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  ""
  ```

  </div>
</details>

##### `exclude_session_state_from_auth_response`

When true, the parameter session_state will not be included in OpenID Connect
Authentication Response.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `exclude_issuer_from_auth_response`

When true, the parameter iss will not be included in OpenID Connect
Authentication Response.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  null
  ```

  </div>
</details>

##### `use_refresh_tokens`

If this is true, a refresh_token will be created and added to the token
response. If this is false then no refresh_token will be generated.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  true
  ```

  </div>
</details>

##### `use_refresh_tokens_client_credentials`

If this is true, a refresh_token will be created and added to the token
response if the client_credentials grant is used and a user session will be
created. If this is false then no refresh_token will be generated and the
associated user session will be removed, in accordance with OAuth 2.0 RFC6749
Section 4.4.3.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `standard_token_exchange_enabled`

Enables support for Standard Token Exchange

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `allow_refresh_token_in_standard_token_exchange`

Defines whether to allow refresh token in Standard Token Exchange. Possible
values are NO (default), and SAME_SESSION.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  NO
  ```

  </div>
</details>

##### `oauth2_device_authorization_grant_enabled`

Enables support for OAuth 2.0 Device Authorization Grant, which means that
client is an application on device that has limited input capabilities or lack
a suitable browser.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  null
  ```

  </div>
</details>

##### `oauth2_device_code_lifespan`

The maximum amount of time a client has to finish the device code flow before
it expires.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  ""
  ```

  </div>
</details>

##### `oauth2_device_polling_interval`

The minimum amount of time in seconds that the client should wait between
polling requests to the token endpoint.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  ""
  ```

  </div>
</details>

##### `backchannel_logout_url`

The URL that will cause the client to log itself out when a logout request is
sent to this realm.
If omitted, no logout request will be sent to the client is this case.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  ""
  ```

  </div>
</details>

##### `backchannel_logout_session_required`

When true, a sid (session ID), claim will be included in the logout token when
the backchannel logout URL is used.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  true
  ```

  </div>
</details>

##### `backchannel_logout_revoke_offline_sessions`

Specifying whether a "revoke_offline_access" event is included in the Logout
Token when the Backchannel Logout URL is used. Keycloak will revoke offline
sessions when receiving a Logout Token with this event.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `always_display_in_console`

Always list this client in the Account UI, even if the user does not have an
active session.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `extra_config`

A map of key/value pairs to add extra configuration attributes to this client.
This can be used for custom attributes, or to add configuration attributes
that are not yet supported by this Terraform provider.

Use this attribute at your own risk, as it may conflict with top-level
configuration attributes in future provider updates.

For example, the extra_config map can be used to set Authentication Context
Class Reference (ACR) to Level of Authentication (LoA), mapping

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  map(string)
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  {}
  ```

  </div>
</details>

##### `import`

When true, the client with the specified client_id is assumed to already
exist, and it will be imported into state instead of being created.
This attribute is useful when dealing with clients that Keycloak creates
automatically during realm creation, such as account and admin-cli.
Note, that the client will not be removed during destruction if import is true.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `default_scopes`

An array of default client scope names to attach to this client.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  list(string)
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  []
  ```

  </div>
</details>

##### `optional_scopes`

An array of client scope names to attach to this client as optional scopes.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  list(string)
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  []
  ```

  </div>
</details>

##### `realm_roles`

A set of realm role names to assign to the service account user of this client.
This is applicable only when service_accounts_enabled is true.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  set(string)
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  []
  ```

  </div>
</details>
<!-- markdownlint-restore -->

### Outputs

* `this`:
  ID of the deployed client

</details>

<!-- END TF-DOCS -->

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check [issues page][issues_pages].

You can also take a look at the [CONTRIBUTING.md][contributing].

[issues_pages]: https://framagit.org/rdeville-public/opentofu/gitlab-user/-/issues
[contributing]: https://framagit.org/rdeville-public/opentofu/gitlab-user/blob/main/CONTRIBUTING.md

## 👤 Maintainers

- 📧 [**Romain Deville** \<code@romaindeville.fr\>](mailto:code@romaindeville.fr)
  - Website: [https://romaindeville.fr](https://romaindeville.fr)
  - Github: [@rdeville](https://github.com/rdeville)
  - Gitlab: [@r.deville](https://gitlab.com/r.deville)
  - Framagit: [@rdeville](https://framagit.org/rdeville)

## 📝 License

Copyright © 2026

- [Romain Deville \<code@romaindeville.fr\>](code@romaindeville.fr)

This project is under following licenses (**OR**) :

- [MIT][main_license]
- [BEERWARE][beerware_license]

[main_license]: https://framagit.org/rdeville-public/opentofu/gitlab-user/blob/main/LICENSE
[beerware_license]: https://framagit.org/rdeville-public/opentofu/gitlab-user/blob/main/LICENSE.BEERWARE
