\# Week 2 — OAuth2/OIDC Setup (Ringkasan)



\## Konfigurasi Singkat

\- \*\*Provider\*\*: Auth0 (Regular Web App)

\- \*\*Callback URL\*\*: `http://localhost:3000/callback`

\- \*\*Well-known config\*\*: `issuer`, `authorization\_endpoint`, dan `token\_endpoint` diverifikasi ✅



\## Flow \& Evidence

\- \*\*Screenshots\*\*:

&nbsp; - `findings/week2/screenshots/oauth\_provider\_setup.png`

&nbsp; - `findings/week2/screenshots/oidc\_wellknown.png` (opsional, evidence cek .well-known)

\- \*\*Notes\*\*:

&nbsp; - `findings/week2/notes/oidc\_provider\_config.md`

&nbsp; - `findings/week2/notes/troubleshooting.md` (jika ada error/solusi)



\## Hygiene

\- Tidak ada secrets yang ter-commit ke repo.

\- File `.env.example` diperbarui untuk variabel penting (`AUTH\_DOMAIN`, `CLIENT\_ID`, `CLIENT\_SECRET` dummy).



\## Next Steps

\- \*\*W2D2\*\*: Uji PKCE manual → lakukan authorization code flow \& token exchange.

\- \*\*W2D3–W2D5\*\*: Konfigurasi Postman Environment + pre-request script untuk refresh token otomatis.

\- \*\*W2D6\*\*: Lengkapi laporan mingguan dengan hasil uji token \& workflow Postman.



