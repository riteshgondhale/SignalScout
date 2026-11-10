# SignalScout 📡

**Open-Source Social Intent Lead Finder & Anti-Slop Outreach Studio (Powered by Google Gemini 1.5 Flash)**

[![License: MIT](https://img.shields.io/badge/License-MIT-emerald.svg)](https://github.com/riteshgondhale/SignalScout/blob/main/LICENSE)
[![GitHub Repo](https://img.shields.io/badge/GitHub-riteshgondhale%2FSignalScout-blue?logo=github)](https://github.com/riteshgondhale/SignalScout)

SignalScout monitors public conversations across **Reddit**, **X (Twitter)**, and **LinkedIn** where prospective buyers are actively complaining about competitors, asking for tool/freelancer recommendations, or venting about technical bottlenecks.

Built for **B2B freelancers, consultants, indie makers, and micro-SaaS founders** who want a daily stream of warm, high-intent leads without paying $399–$1,000/mo for enterprise AI SDRs or risking account bans with session-cookie scrapers.

---

## ✨ Why SignalScout?

- **Zero Boolean Setup (60-Second AI Onboarding):** Paste your website URL or a 2-sentence description of your service. Gemini 1.5 Flash automatically extracts your buyer personas, competitors, high-intent phrases, target subreddits, and negative noise filters.
- **Two-Tier Gemini 1.5 Flash Pipeline ($0 Free-Tier Friendly):**
  - **Tier 1 (Fast Binary Noise Gate):** Evaluates batches of 15 raw posts per request to discard >85% of job seekers, `[For Hire]` spam, and self-promotion while staying well inside the free 15 RPM / 1,500 RPD Gemini quota.
  - **Tier 2 (Deep Scoring & Anti-Slop Studio):** Scores buyer urgency (1–100), extracts the verbatim quote, and writes 3 peer-level response options (*Helpful Public Reply*, *Direct DM Hook*, *Diagnostic Question*) with strict guardrails banning AI clichés.
- **100% Ban-Proof Architecture:** Never asks for your LinkedIn `li_at` session cookie or X auth token. Uses public APIs and Google Custom Search dorks, keeping final outreach human-in-the-loop via 1-click copy & deep-link reply.

---

## 🏗️ $0 Free-Tier Tech Stack

| Layer | Technology | Free Tier Allowance |
| :--- | :--- | :--- |
| **Frontend & API** | Next.js 15 (App Router) + Tailwind CSS | Vercel Hobby (Free) |
| **LLM Engine** | Google Gemini 1.5 Flash (`@google/generative-ai`) | 15 RPM / 1,500 RPD Free via Google AI Studio |
| **Database & Auth** | Supabase (PostgreSQL + RLS) | 500 MB Database + 50,000 MAU (Includes 7-day noise auto-pruning) |
| **Background Cron** | Inngest Cloud | 25,000 runs/month Free |
| **Signal Collectors** | Reddit API + Google Custom Search JSON API | 100 RPM (Reddit) + 100 queries/day (Google CSE) |
| **Alerts & Digests** | Slack Incoming Webhooks + Resend | Unlimited Webhooks + 3,000 emails/mo |

---

## 🚀 Quick Start (Local Development)

### 1. Clone & Install Dependencies

```bash
git clone https://github.com/riteshgondhale/SignalScout.git
cd SignalScout
npm install
```

### 2. Configure Environment Variables

```bash
cp .env.example .env.local
```

Add your free **Google AI Studio Gemini API Key** (`GEMINI_API_KEY`) and **Supabase** credentials in `.env.local`. *(Note: The app includes an interactive local demo fallback so you can test the UI and onboarding wizard immediately even before connecting Supabase).*

### 3. Apply Database Schema (Supabase)

Run the SQL migration in `supabase/migrations/0001_initial_schema.sql` inside your Supabase SQL Editor.

### 4. Start the App

```bash
npm run dev
```

Open `http://localhost:3000` to view your live SignalScout dashboard and test the **60s AI Setup Wizard**.

---

## 📂 Repository Structure

```text
SignalScout/
├── docs/
│   └── PRD_and_Technical_Design_Doc.md    # Full PRD & System Architecture
├── supabase/
│   └── migrations/
│       └── 0001_initial_schema.sql        # PostgreSQL tables, indexes, RLS & noise pruning
├── src/
│   ├── app/
│   │   ├── api/
│   │   │   ├── inngest/route.ts           # Background worker endpoint
│   │   │   ├── leads/feedback/route.ts    # Status & negative keyword auto-tuning API
│   │   │   └── onboarding/route.ts        # 60s Gemini ICP & keyword generator API
│   │   ├── globals.css
│   │   ├── layout.tsx
│   │   └── page.tsx                       # Lead Feed & Anti-Slop Outreach Studio UI
│   ├── inngest/
│   │   └── functions.ts                   # 30-min scheduled ingestion & 2-tier Gemini pipeline
│   └── lib/
│       ├── collectors/
│       │   ├── reddit.ts                  # Subreddit collector + SHA-256 deduplication
│       │   └── social-search.ts           # Ban-proof X & LinkedIn Google CSE dork collector
│       ├── demo-data.ts                   # Instant seed leads for zero-empty-state onboarding
│       ├── gemini.ts                      # Gemini 1.5 Flash Tier-1 & Tier-2 structured engines
│       └── supabase.ts                    # Supabase client & admin service role helpers
├── LICENSE
└── package.json
```

---

## 📜 License

MIT License — Copyright (c) 2026 Ritesh Gondhale. Built for the Google Buildathon.
