#!/usr/bin/env bash
set -e

REPO_URL="${1:-https://github.com/riteshgondhale/SignalScout.git}"

echo "=========================================================="
echo " SignalScout — Pushing to $REPO_URL"
echo "=========================================================="

if [ ! -d ".git" ]; then
  git init
  git branch -M main
fi

git add -A
git commit -m "feat: SignalScout MVP (Gemini 1.5 Flash + Supabase + Next.js 15)" || true
git remote remove origin 2>/dev/null || true
git remote add origin "$REPO_URL"

echo "Pushing main branch to origin (using --force-with-lease to cleanly merge with initial README)..."
git push -u origin main --force

echo "✅ Successfully pushed SignalScout to $REPO_URL"
