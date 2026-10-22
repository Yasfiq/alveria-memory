# Product Ideas (SaaS)

Log ide produk. Format: Problem → Solusi → Market → MVP.

---

## 1. AI Invoice Collector untuk Freelancer Indonesia
- **Problem**: Invoice PDF freelancer tidak punya status. Freelancer harus manual follow-up klien, cocok mutasi rekening sendiri. Riset: invoice tanpa payment link bayarnya 30% lebih lambat.
- **Solusi**: Invoice + payment link (QRIS/VA/e-wallet) + reminder otomatis WhatsApp sebelum/saat/setelah jatuh tempo + dashboard status (pending/paid/expired). PPh 21/23 auto-calculate.
- **Market**: Freelancer & kreator Indonesia (jutaan orang), underserved — tools luar (Invoice Ninja, Wave) tidak paham QRIS/lokal.
- **MVP**: Generator invoice → link bayar via payment gateway API (Midtrans/Xendit) → webhook update status → reminder cron. ~2-4 minggu solo dev.
- **Monetisasi**: Free 5 invoice/bulan, Rp49rb/bulan unlimited.

## 2. Client Portal untuk Freelancer/Agency Kecil
- **Problem**: Freelancer & micro-agency bagi deliverable lewat chat + Google Drive — klien bingung, approval kacau, revisi tak tercatat.
- **Solusi**: Portal per klien: timeline milestone, upload deliverable, approve/reject revision, invoice terintegrasi. White-label.
- **Market**: Agensi kecil & freelancer B2B. Sinyal pasar: "$30K-$400K ARR" (flowjam 2026).
- **MVP**: Auth per klien + upload + status approval + notif WA/email. Tumpang tindih #1 (invoice) — bisa jadi modul.
- **Monetisasi**: $19-$29/mo per freelancer.

## 3. AI Meeting Notes → Action Items (Vertical: Konsultan/Agency)
- **Problem**: Tim konsultan/agency puluhan meeting/minggu, action items hilang di chat.
- **Solusi**: Rekaman/notes meeting → summary + action items + owner + deadline → auto push ke task manager (Notion/Todoist). Integrasi Zoom/Meet.
- **Market**: Kompetitor ada (Otter, Fireflies) tapi mahal & EN-centric. Angle: Bahasa Indonesia + lokal integrasi (WA notif).
- **MVP**: Upload audio/transkrip → LLM extract action items → export Notion.
- **Monetisasi**: $15/mo individual.

## 4. SaaS Subscription Auditor
- **Problem**: Startup kecil & remote team bayar langganan zombie (seat mati, tool duplikat) rata-rata $1.200/mo terbuang.
- **Solusi**: Parse mutasi bank/receipt → deteksi langganan duplikat & tak terpakai → laporan penghematan + saran cancel.
- **Market**: Startup <50 orang, fractional CFO.
- **MVP**: Upload bank statement CSV → klasifikasi transaksi langganan → report. Tanpa integrasi bank dulu (hindari regulasi).
- **Monetisasi**: $99/mo. Payback jelas bagi klien.

---

## Matriks Prioritas
| Ide | Effort | Market fit utk Yasfiq | Recomendasi |
|-----|--------|----------------------|-------------|
| 1. Invoice ID | Medium | Tinggi (pengalaman freelance) | ★ Buat duluan |
| 2. Client Portal | Medium | Tinggi | Fase 2 (modul #1) |
| 3. Meeting Notes | Medium | Sedang | Alternatif |
| 4. Subs Auditor | High | Rendah (butuh akses finansial) | Tunda |

**Keputusan awal**: Ide #1. Alasan: pain pribadi (pengalaman freelance), MVP kecil, beda lokal (QRIS+WA), infra sudah ada (Hermes, payment gateway API, Telegram bot utk notif).
