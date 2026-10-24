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
- **Frontend**: Single-file `index.html` + Tailwind CDN. Bebas build step.
- **Backend**: Single-file `app.py` FastAPI.
- **Performance**: Latensi respon LLM < 3 detik.
- **Hosting**: Render / Railway / Vercel Python.
- **Cost**: ~$0 per user (model flash murah / BYOK opsi gratis).

## 6. Success Metrics
- Time-to-generate: < 5 detik.
- Copy rate: > 60% user klik tombol copy setelah generate.
- Dev completion time: MVP selesai dibangun < 2 jam.
