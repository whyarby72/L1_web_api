\# Week 1 — Proxy Setup Notes (Burp Suite + Firefox)



\## 🎯 Tujuan

\- Mengonfigurasi Firefox agar semua HTTP/HTTPS traffic dialirkan ke \*\*Burp Suite Proxy\*\*.  

\- Menginstall \*\*Burp CA Certificate\*\* agar HTTPS bisa di-intercept tanpa error SSL.  

\- Menyimpan evidence (screenshot + project Burp) sebagai deliverable Minggu 1.  



---



\## 🛠️ Langkah Setup



\### 1. Konfigurasi Proxy Firefox

\- Masuk \*\*Settings → Network Settings → Manual proxy configuration\*\*.  

\- Set \*\*HTTP Proxy\*\*: `127.0.0.1`, Port `8080`.  

\- Centang \*\*Also use this proxy for HTTPS\*\*.  

\- Kosongkan \*\*SOCKS Host\*\*.  

\- Klik \*\*OK\*\*.



📸 Evidence: `screenshots/day2\_firefox\_proxy\_settings.png`



---



\### 2. Install Burp CA Certificate

\- Di Firefox buka `http://burpsuite` → download `cacert.der`.  

\- Simpan sebagai `burp\_ca.crt`.  

\- Masuk \*\*Settings → Privacy \& Security → Certificates → View Certificates → Authorities\*\*.  

\- Import `burp\_ca.crt` → centang \*Trust this CA to identify websites\*.  

\- Klik \*\*OK\*\*.



📸 Evidence: `screenshots/day2\_firefox\_ca\_import.png`



---



\### 3. Verifikasi Intercept HTTPS

\- Buka `https://example.com` di Firefox.  

\- Lihat \*\*Burp → Proxy → Intercept / HTTP history\*\* → harus ada request ke `example.com`.  



📸 Evidence: `screenshots/day2\_firefox\_https\_intercept.png`



---



\### 4. Export Burp Project

\- Burp → \*\*Project → Save copy\*\*.  

\- Simpan project dengan nama:  

burp\_projects/week1\_burp\_project\_01.burp



---



\## ✅ Quality Gate

\- \[x] Firefox menggunakan Burp sebagai proxy.  

\- \[x] Burp CA berhasil diimport → tidak ada SSL error.  

\- \[x] HTTPS traffic (`example.com`) berhasil diintercept.  

\- \[x] Evidence lengkap (screenshot + Burp project).  



---



\## 📂 Deliverables

\- `burp\_projects/week1\_burp\_project\_01.burp`  

\- `screenshots/day2\_firefox\_proxy\_settings.png`  

\- `screenshots/day2\_firefox\_ca\_import.png`  

\- `screenshots/day2\_firefox\_https\_intercept.png`  

\- `notes/proxy\_setup\_notes.md` (file ini)  



