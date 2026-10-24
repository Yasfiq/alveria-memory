# PRD: Threads Showcase Generator for Developers

## 1. Overview & Problem Statement
- **Produk**: Threads Showcase Generator
- **Target User**: Solo developer, indie hacker, AI builder.
- **Problem**: Developer bangun produk bagus tapi gagal distribusi di Threads. Malas nulis copy promosi, bingung format engagement Threads, tidak ada waktu posting manual yang menarik.
- **Solusi**: Web app generator copy Threads instan berbasis data proyek dev (nama, masalah, tech stack, link). Sekali klik hasilkan 3 sudut pandang postingan siap pakai.

## 2. Core Value Loop
`Input link repo / data teknis dasar` -> `LLM transform gaya Threads dev-native` -> `Preview 3 variasi (<500 char) + Copy 1-klik`.

## 3. User Stories
- Sebagai developer, saya ingin input nama produk dan masalah agar dapat teks promosi tanpa mikir copywriting.
- Sebagai developer, saya ingin melihat 3 sudut pandang postingan (cerita dev, arsitektur teknis, promo langsung) agar bisa pilih sesuai karakter akun saya.
- Sebagai developer, saya ingin counter karakter otomatis agar postingan tidak kepotong limit 500 karakter Threads.
- Sebagai developer, saya ingin tombol 1-klik copy agar cepat paste ke aplikasi Threads.

## 3.1. Detailed User Flow
1. **Landing & Context**: User buka web -> lihat form input ringkas (4 field) + contoh placeholder dev-relatable.
2. **Data Input**: User isi Nama Produk, Masalah, Tech Stack, Link Demo (opsional).
3. **Trigger**: User klik tombol **"Generate Threads Post"** (disabled jika field wajib kosong).
4. **Processing State**: Tombol berubah loading spinner + status skeleton / text "Menulis copy ala dev...".
5. **Result Display**: Muncul 3 Tab/Card variasi:
   - *Tab 1: Build in Public* (cerita proses/pain).
   - *Tab 2: Tech Breakdown* (stack & arsitektur).
   - *Tab 3: Direct Showcase* (masalah + solusi + CTA).
6. **Preview & Inspection**:
   - Preview meniru layout visual Threads (avatar default, bubble, typography).
   - Live character counter (< 500 char, warna hijau; jika > 500 warna merah).
7. **Action**: User klik tombol **"Copy Text"** -> Icon berubah centang hijau + toast "Tersalin ke clipboard".
8. **Next Action**: Tombol sekunder **"Regenerate"** jika ingin variasi baru, atau edit form untuk produk lain.

## 4. Scope Breakdown

### In-Scope (MVP v0)
1. **Input Interface**:
   - Project Name (Text, wajib)
   - Problem Solved (Textarea singkat, wajib)
   - Tech Stack / Architecture (Text, wajib)
   - Demo / Repo URL (Text URL, opsional)
2. **LLM Engine**:
   - Model: Fast LLM (Gemini 2.5 Flash / GPT-4o-mini).
   - Strict output JSON: 3 variasi post.
   - Tone: Santai, dev-to-dev, hook kuat, tanpa corporate jargon, minim hashtag.
   - Variasi 1: *Build in Public* (masalah + proses bikin).
   - Variasi 2: *Tech Stack Breakdown* (kenapa pilih stack ini + efisiensi).
   - Variasi 3: *Showcase & Demo* (masalah + solusi + CTA link).
3. **Output Interface**:
   - Kartu preview per variasi.
   - Karakter counter realtime (max 500 char).
   - Tombol copy-to-clipboard dengan indikator sukses.

### Out-of-Scope (Cut v0)
- Autentikasi / user login / session management.
- Database riwayat / save post history.
- Direct posting via Meta Graph API (hindari proses review berlarut-larut).
- Auto-scraping web / GitHub repo URL (v0 manual input biar simpel, v1 baru tambah).
- Monetisasi / billing gateway.

## 5. Non-Functional Requirements & Stack
- **Frontend**: Vite + React + Tailwind CSS + Lucide Icons. Client-side state murni.
- **Backend / API**: Minimal API endpoint (FastAPI / Serverless Function) atau direct LLM call via client jika model BYOK.
- **Design Pattern**: Minimal Component-Driven Architecture (Feature-based flat folder).
- **Performance**: Latensi respon LLM < 3 detik, UI update instant reaktif.
- **Hosting**: Vercel / Cloudflare Pages.
- **Cost**: ~$0 per user (model flash murah / BYOK opsi gratis).

## 6. Success Metrics
- Time-to-generate: < 5 detik.
- Copy rate: > 60% user klik tombol copy setelah generate.
- Dev completion time: MVP selesai dibangun < 2 jam.

## 7. Timeline Eksekusi Malam Ini (Target Selesai: 90 - 120 Menit)
- **Fase 1: Setup & Scaffolding (15 menit)**
  - Inisialisasi Vite + React + Tailwind CSS + Lucide Icons.
  - Setup folder structure sesuai design pattern.
- **Fase 2: UI & Dummy State (25 menit)**
  - Buat form input (`GeneratorForm`), Card Preview gaya Threads (`ThreadCard`), dan Layout utama (`App.jsx`).
  - Pasang live character counter & copy-to-clipboard handler.
- **Fase 3: LLM Integration & Service Adapter (25 menit)**
  - Implementasi `services/llm.js` & custom hook `useThreadGenerator.js`.
  - Tuning system prompt untuk output JSON 3 variasi (< 500 char, gaya dev Threads).
- **Fase 4: Testing, Polish & Build Check (20 menit)**
  - Smoke test generate copy dengan berbagai skenario produk dev.
  - Verifikasi build static (`npm run build`).
- **Total Durasi**: ~90 menit (kelar malam ini).

## 8. Strategi Testing (Pragmatis & Cepat)

### A. Automated Sanity Check (5 menit)
1. **Build Test**: `npm run build` harus exit code 0 tanpa error TypeScript/JSX/bundler.
2. **Lint & Syntax Check**: Pastikan tidak ada syntax error atau broken imports.

### B. Functional & UI Test (10 menit)
1. **Form Validation Test**:
   - Submit form kosong -> tombol disabled / muncul pesan validasi.
   - Isi semua field -> tombol enable.
2. **Clipboard Action Test**:
   - Klik tombol Copy -> verifikasi data masuk clipboard & visual checkmark muncul.
3. **Character Counter Test**:
   - Hitung manual teks output -> cocokkan dengan angka counter UI.
   - Indikator warna tetap aman (hijau jika <= 500 karakter).

### C. LLM Output Quality Check (Dogfooding - 3 Skenario Nyata)
Uji generate 3 variasi dengan input ril:
- **Test Case 1 (Micro SaaS)**: AI Invoice Generator untuk Freelancer.
- **Test Case 2 (Open Source CLI)**: Tool terminal penghemat konsumsi RAM.
- **Test Case 3 (Developer Utility)**: API Mocking engine lokal.

**Kriteria Lolos Kualitas:**
- Panjang teks per variasi < 500 karakter.
- Gaya bahasa santai, relevan untuk audiens developer Threads (bukan bahasa sales kaku).
- Output valid JSON tanpa markdown rusak.
