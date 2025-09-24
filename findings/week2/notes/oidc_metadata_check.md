\# OIDC Metadata Check



📅 Tanggal: 2025-09-24  

🔎 Tujuan: Verifikasi metadata OpenID Connect dari Authorization Server (Auth0).



---



\## Command



```bash

curl -s https://dev-pmgzfvrxbdwvrh3h.us.auth0.com/.well-known/openid-configuration | jq '.issuer, .authorization\_endpoint, .token\_endpoint'



"https://dev-pmgzfvrxbdwvrh3h.us.auth0.com/"

"https://dev-pmgzfvrxbdwvrh3h.us.auth0.com/authorize"

"https://dev-pmgzfvrxbdwvrh3h.us.auth0.com/oauth/token"

