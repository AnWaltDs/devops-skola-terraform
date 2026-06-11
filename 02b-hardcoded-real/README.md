# 02b — Hardcoded with real credentials

This is the same anti-pattern as 02a, but with real credentials so that
`tofu plan` actually connects to the OpenStack API.

## Why this exists

02a uses fake values — the plan succeeds syntactically but never talks to the API.
This version proves that hardcoding works **technically**, making the anti-pattern
even more tempting for beginners.

## The problem

Look at `main.tf` — the password is right there in plain text.
Push this to Git and everyone can see it.

## Tasks

1. Run `tofu init && tofu plan` — it connects for real
2. Look at the password in main.tf
3. Discuss: what happens when this file is committed to Git?
4. Move on to 03 where credentials come from environment variables

## WARNING

Do NOT commit this file to a real repository. This is for workshop demonstration only.
