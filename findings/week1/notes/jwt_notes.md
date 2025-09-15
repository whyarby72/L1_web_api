# JWT Weakness Testing (Lab) – Week 1 Day 3

## Token Variants Tested
1. Normal dengan `exp` (15 menit)
2. Tanpa `exp` (No expiry)
3. Fake `alg:none`

---

## 1. Token Normal (ada `exp`)
- **Header**: alg=HS256, typ=JWT  
- **Payload**: sub=1234567890, role=tester, exp=+15 menit  
- ✅ Token expired setelah 15 menit → behaviour benar.  

📸 Evidence: [day3_jwt_token_expired](../screenshots/day3_jwt_token_expired)

---

## 2. Token tanpa `exp`
- **Header**: alg=HS256  
- **Payload**: tidak ada `exp`  
- ❌ Token valid tanpa batas waktu.  

📸 Evidence: [day3_jwt_token_no_expired](../screenshots/day3_jwt_token_no_expired)

---

## 3. Token dengan `alg:none`
- **Header**: alg=none, typ=JWT  
- **Payload**: sub=1234567890, role=tester  
- ❌ Jika server menerima → vuln bypass signature.  

📸 Evidence: [day3_jwt_token_no_alg](../screenshots/day3_jwt_token_no_alg)

---

## Summary Findings
- [x] No expiry → token reuse
- [x] Alg:none exploit → bypass signature
- [ ] Audience misuse (potensi, belum diuji server)

---

## Recommendations
1. Enforce expiry (`exp`) & validasi waktu.  
2. Reject semua token dengan `alg:none`.  
3. Validasi audience (`aud`) sesuai aplikasi target.
