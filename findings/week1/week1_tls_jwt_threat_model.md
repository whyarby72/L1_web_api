\# Week 1 Report — TLS Intercept \& JWT Basics



\## 📌 Executive Summary

Pada minggu pertama, fokus utama adalah \*\*setup proxy HTTPS menggunakan Burp Suite\*\* dan \*\*memahami dasar JWT (JSON Web Token)\*\*.  

Hasil yang dicapai:

\- Firefox berhasil dikonfigurasi untuk menggunakan Burp Suite sebagai proxy.

\- Burp CA berhasil diimport sehingga HTTPS traffic dapat di-intercept tanpa error.

\- Traffic HTTPS ke `https://example.com` berhasil terlihat di Burp.

\- JWT berhasil didapatkan dari aplikasi lab dan didecode untuk analisis awal.

\- Threat modeling awal dilakukan untuk mengidentifikasi potensi risiko pada alur autentikasi.



---



\## 🎯 Objectives Minggu 1

1\. \*\*Setup Burp Proxy + HTTPS Intercept\*\*

&nbsp;  - Konfigurasi Firefox untuk routing traffic melalui Burp (127.0.0.1:8080).

&nbsp;  - Install Burp CA di Firefox agar HTTPS dapat di-decrypt.

&nbsp;  - Verifikasi intercept `example.com`.



2\. \*\*JWT Basics\*\*

&nbsp;  - Mengidentifikasi JWT pada request Authorization header.

&nbsp;  - Melakukan decode JWT (header, payload, signature).

&nbsp;  - Memahami kelemahan umum (hardcoded secret, none algorithm, base64 exposure).



3\. \*\*Threat Model (awal)\*\*

&nbsp;  - Analisis potensi serangan terkait TLS \& JWT.



---



\## 🛠️ Technical Evidence



\### Proxy Setup

\- Firefox Proxy Settings → ✅ `127.0.0.1:8080` + HTTPS enabled  

&nbsp; 📸 `screenshots/day2\_firefox\_proxy\_settings.png`



\- Burp CA Import ke Firefox (Authorities) → ✅  

&nbsp; 📸 `screenshots/day2\_firefox\_ca\_import.png`



\- HTTPS Intercept `example.com` → ✅ terlihat di \*\*Burp Proxy\*\*  

&nbsp; 📸 `screenshots/day2\_firefox\_https\_intercept.png`



\- Burp Project Export → ✅  

&nbsp; 📂 `burp\_projects/week1\_burp\_project\_01.burp`



---



\### JWT Decode (Day 3)

\- JWT diambil dari request API `/api/login`.  

\- Token format: `header.payload.signature`.  

\- Decode menggunakan \[jwt.io](https://jwt.io/) atau `jwt-tool`.  

\- Evidence:  

&nbsp; - Header: `{ "alg": "HS256", "typ": "JWT" }`  

&nbsp; - Payload: `{ "user": "alice", "role": "user" }`



---



\## 🔎 Threat Model (Week 1 Scope)

\### Assets

\- HTTPS communication (Firefox ↔ Burp ↔ Server).  

\- JWT token dalam Authorization header.  



\### Threats

\- \*\*TLS MITM\*\*: jika CA tidak trusted, traffic akan gagal atau dimanipulasi.  

\- \*\*JWT Risks\*\*:  

&nbsp; - Weak secret (brute force possible).  

&nbsp; - `alg: none` attack jika tidak divalidasi dengan benar.  

&nbsp; - Sensitive data dalam payload (exposed via base64).  



\### Mitigations

\- Gunakan CA resmi + pinning di production (bukan trust user-installed CA).  

\- Pastikan server memvalidasi JWT dengan algoritma kuat (HS256/RS256).  

\- Jangan simpan data sensitif langsung di payload JWT.  



---



\## 📂 Deliverables

\- `screenshots/day2\_firefox\_proxy\_settings.png`  

\- `screenshots/day2\_firefox\_ca\_import.png`  

\- `screenshots/day2\_firefox\_https\_intercept.png`  

\- `burp\_projects/week1\_burp\_project\_01.burp`  

\- `notes/proxy\_setup\_notes.md`  

\- `week1\_tls\_jwt\_threat\_model.md` (file ini)  



---



\## 🚀 Next Steps (Week 2 Preview)

\- Deep dive OAuth2 / OIDC (Authorization Code Flow).  

\- Setup Postman environment untuk token handling.  

\- Lanjut threat model: token leakage, replay, refresh token abuse.  

