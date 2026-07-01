# SafeHaven Database Schema

**Document ID:** SH-DB-001

**Version:** 1.0

**Status:** Approved

**Owner:** Cory Gleisinger

**Last Updated:** July 2026

---

# Purpose

This document defines the logical database structure for SafeHaven Release 1.0.

The schema provides the foundation for storing household information, user accounts, inventory, documents, AI insights, reminders, and future platform capabilities.

The schema is designed for PostgreSQL using Supabase.

---

# Design Principles

The SafeHaven database shall be:

- Secure
- Normalized
- Scalable
- Extensible
- AI-friendly
- Cloud-native

Every table shall include:

- UUID Primary Key
- Created Date
- Updated Date
- Soft Delete support (future where appropriate)

---

# Core Entity Relationships

User

↓

Household

↓

Property

↓

Room

↓

Item

↓

Documents

↓

Reminders

↓

Maintenance

↓

AI Insights

---

# Table Overview

| Table | Purpose |
|--------|---------|
| users | User accounts |
| households | Household container |
| household_members | Household permissions |
| properties | Homes owned by household |
| rooms | Rooms within properties |
| items | Household inventory |
| documents | Receipts, manuals, warranties, invoices |
| reminders | Scheduled reminders |
| maintenance_history | Completed maintenance |
| ai_insights | AI recommendations |
| search_history | Search analytics |
| setup_wizard_progress | Wizard completion tracking |

---

# users

Purpose

Store user profile information.

Primary Fields

- user_id
- email
- first_name
- last_name
- subscription_tier
- created_at
- updated_at

Relationships

One User

↓

Many Household Memberships

---

# households

Purpose

Represents one household.

Fields

- household_id
- owner_user_id
- household_name
- plan_type
- completion_score
- created_at
- updated_at

Relationships

One Household

↓

Many Properties

↓

Many Members

↓

Many Items

---

# household_members

Purpose

Manage household sharing.

Fields

- member_id
- household_id
- user_id
- role
- invite_status

Roles

Owner

Admin

Member

---

# properties

Purpose

Support one or multiple homes.

Fields

- property_id
- household_id
- property_name
- property_type
- city
- state
- year_built

Examples

Primary Home

Vacation Home

Rental Property

---

# rooms

Purpose

Organize household inventory.

Fields

- room_id
- property_id
- room_name
- room_type

Examples

Kitchen

Garage

Laundry

Basement

Outdoor

---

# items

Purpose

Core household inventory.

Fields

- item_id
- household_id
- property_id
- room_id
- item_name
- category
- brand
- model_number
- serial_number
- purchase_date
- purchase_price
- vendor
- warranty_start
- warranty_expiration
- condition
- notes
- primary_photo
- created_at
- updated_at

---

# documents

Purpose

Store uploaded files.

Supported Types

Receipt

Manual

Warranty

Invoice

Photo

Fields

- document_id
- household_id
- item_id
- document_type
- file_url
- extracted_text
- upload_status

---

# reminders

Purpose

Manage maintenance and custom reminders.

Fields

- reminder_id
- household_id
- item_id
- reminder_type
- title
- due_date
- repeat_interval
- priority
- status

---

# maintenance_history

Purpose

Track completed maintenance.

Fields

- maintenance_id
- household_id
- item_id
- action
- completed_date
- cost
- notes

---

# ai_insights

Purpose

Store AI-generated recommendations.

Fields

- insight_id
- household_id
- item_id
- insight_type
- recommendation
- confidence
- status

---

# search_history

Purpose

Improve future search experience.

Fields

- search_id
- user_id
- household_id
- query
- result_count
- created_at

---

# setup_wizard_progress

Purpose

Track onboarding completion.

Fields

- progress_id
- household_id
- property_id
- room_type
- item_prompt
- status
- completed_at

---

# Relationships

users

↓

household_members

↓

households

↓

properties

↓

rooms

↓

items

↓

documents

↓

reminders

↓

maintenance_history

↓

ai_insights

---

# Data Ownership

Every record belongs to exactly one household.

All permissions inherit from household membership.

No data may cross household boundaries.

---

# Future Tables

Release 2+

service_history

insurance_policies

paint_inventory

projects

contractors

smart_devices

subscriptions

marketplace

---

# Database Standards

Primary Keys

UUID

Foreign Keys

Enforced

Dates

UTC

Deletes

Soft Delete (future)

Naming

snake_case

Indexes

Foreign Keys

Search Columns

Frequently Queried Fields

---

# Success Criteria

The database shall support:

- Millions of users
- Millions of inventory items
- Millions of uploaded documents
- Multiple properties
- Shared households
- AI search
- Future feature expansion

---

# Revision History

| Version | Date | Author | Description |
|----------|------|--------|-------------|
| 1.0 | July 2026 | Cory Gleisinger | Initial Database Schema |
