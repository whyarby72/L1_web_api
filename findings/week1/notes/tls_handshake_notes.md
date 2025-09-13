\# TLS Handshake Notes (Day 2)



\## Context

\- Situs diuji: https://github.com/

\- Tools: Burp Suite (intercept), Wireshark (capture)

\- File capture: findings/week1/pcap/day2\_tls\_handshake.pcapng



\## Step Handshake



1\. \*\*ClientHello\*\*

&nbsp;  - TLS Version: TLS 1.2 → (supported\_versions extension juga menawarkan TLS 1.3).

&nbsp;  - Cipher Suites ditawarkan: >10 opsi (AES, CHACHA, ECDHE).

&nbsp;  - Extensions: 

&nbsp;    - SNI: github.com

&nbsp;    - supported\_versions: TLS 1.2, TLS 1.3

&nbsp;    - ALPN: h2, http/1.1



2\. \*\*ServerHello\*\*

&nbsp;  - TLS Version: TLS 1.2 (0x0303)

&nbsp;  - Cipher Suite dipilih: `TLS\_AES\_128\_GCM\_SHA256`

&nbsp;  - Extensions: supported\_versions = TLS 1.3



3\. \*\*Certificate\*\*

&nbsp;  - Subject CN: `github.com`

&nbsp;  - Issuer: DigiCert TLS Hybrid ECC SHA384 2020 CA1

&nbsp;  - Validity: current \& trusted (CA valid)



4\. \*\*Key Exchange\*\*

&nbsp;  - Algoritma: ECDHE (Elliptic Curve Diffie-Hellman Ephemeral)

&nbsp;  - Kunci publik digunakan untuk negosiasi session key.



5\. \*\*Finished\*\*

&nbsp;  - Client \& server mengirim “Finished”.

&nbsp;  - Handshake selesai → sesi terenkripsi dengan AES-GCM.



\## Insights

\- Versi TLS yang digunakan: \*\*TLS 1.2 → upgradable ke TLS 1.3\*\*

\- Cipher Suite final: \*\*TLS\_AES\_128\_GCM\_SHA256\*\*

\- Sertifikat: \*\*valid \& trusted\*\* (CA DigiCert)

\- Catatan tambahan: GitHub menerapkan TLS modern dengan support ALPN (HTTP/2).



