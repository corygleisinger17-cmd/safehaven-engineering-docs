# SafeHaven Sprint 0 – Development Environment

**Document ID:** SH-IMP-001

**Version:** 1.0

**Status:** Active

**Sprint Goal**

Create a complete development environment so engineering can begin building SafeHaven.

---

# Sprint Deliverables

By the end of Sprint 0 we will have:

✅ GitHub Repository

✅ FlutterFlow Project

✅ Supabase Project

✅ Database Created

✅ Storage Buckets Created

✅ Authentication Working

✅ FlutterFlow Connected

✅ First User Login

---

# Step 1

## Create Supabase Project

Project Name

safehaven-dev

Database Password

(Store securely)

Region

Closest to your location.

---

# Step 2

Run SQL Scripts

Execute:

001_Create_Database.sql

↓

002_Row_Level_Security.sql

↓

003_Storage_Buckets.sql

Verify all tables exist.

---

# Step 3

Authentication

Enable

Email Authentication

Require Email Verification

Password Reset

Future Providers

Apple

Google

Microsoft

---

# Step 4

Create Storage Buckets

Verify buckets exist:

receipts

manuals

warranties

photos

documents

exports

reports

---

# Step 5

Create FlutterFlow Project

Project Name

SafeHaven MVP

Theme

Material 3

---

# Step 6

Connect FlutterFlow

Connect:

Supabase URL

Anon Key

Test Connection

---

# Step 7

Authentication Test

Build:

Login Screen

Register Screen

Forgot Password

Verify:

User can create account.

---

# Step 8

Create Navigation

Bottom Navigation

Home

Inventory

Upload

Reminders

Profile

Pages may be placeholders.

---

# Step 9

Dashboard Placeholder

Display:

Welcome

Household Name

Quick Add

Recent Items

AI Placeholder

No real functionality yet.

---

# Step 10

Commit to GitHub

Commit Message

Sprint 0 Complete

Development Environment Ready

---

# Sprint Success Criteria

SafeHaven can:

✓ Create user account

✓ Login

✓ Logout

✓ Connect to Supabase

✓ Read database

✓ Navigate between pages

✓ Display dashboard

Release

Alpha 0.1
