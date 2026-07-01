# SafeHaven Screen Specification

**Document ID:** SH-SS-001

**Version:** 1.0

**Status:** Approved

**Owner:** Cory Gleisinger

**Last Updated:** July 2026

---

# Purpose

This document defines every screen included in SafeHaven Release 1.0.

Each screen includes:

- Purpose
- Navigation
- Components
- User Actions
- Data Sources
- Acceptance Criteria

This document serves as the UX contract between Product, Design, and Engineering.

---

# Navigation Structure

Splash Screen

↓

Authentication

↓

Household Creation

↓

Setup Wizard

↓

Dashboard

↓

Inventory

↓

Item Detail

↓

Upload Center

↓

Reminders

↓

Search

↓

Profile

---

# SH-S001 – Splash Screen

## Purpose

Load the application while initializing authentication and user settings.

## Components

- SafeHaven logo
- Loading indicator
- Version number

## Navigation

Automatically routes to:

- Login
- Dashboard

---

# SH-S002 – Login

## Purpose

Authenticate users.

## Components

- Email
- Password
- Login
- Forgot Password
- Create Account

## Navigation

Successful Login →

Dashboard

---

# SH-S003 – Create Account

## Purpose

Register new users.

## Components

- Name
- Email
- Password
- Confirm Password

Navigation

↓

Household Creation

---

# SH-S004 – Household Creation

## Purpose

Create user's household.

## Components

- Household Name
- Property Name
- Address (Optional)
- Continue

Navigation

↓

Setup Wizard

---

# SH-S005 – Setup Wizard

## Purpose

Guide users through initial setup.

## Components

- Progress Bar
- Room Prompt
- Item Prompt
- Skip
- Save

Example

Kitchen

↓

Dishwasher

↓

Photo

↓

Receipt

↓

Save

---

# SH-S006 – Dashboard

## Purpose

Provide household overview.

## Sections

- Search
- Action Center
- AI Insights
- Recent Items
- Household Statistics
- Quick Actions

---

# SH-S007 – Inventory

## Purpose

Display household items.

## Filters

- Room
- Property
- Category
- Warranty

Display

Grid/List Toggle

---

# SH-S008 – Item Detail

## Purpose

Display complete information for one item.

## Sections

Photo

Basic Information

Warranty

Maintenance

Documents

Notes

AI Insights

---

# SH-S009 – Upload Center

## Purpose

Capture household information.

## Upload Options

Receipt

Manual

Warranty

Invoice

Photo

---

# SH-S010 – AI Review

## Purpose

Allow user to confirm extracted AI information.

## Components

Detected:

- Brand
- Model
- Purchase Date
- Warranty
- Price

Buttons

Save

Edit

Discard

---

# SH-S011 – Reminders

## Purpose

Manage household reminders.

Tabs

Upcoming

Completed

Overdue

---

# SH-S012 – Search

## Purpose

Natural language household search.

Examples

"What size furnace filter do I need?"

"Show my lawn mower receipt."

"Find the garage freezer manual."

Search Results

Items

Documents

AI Answer

Related Records

---

# SH-S013 – Profile

## Purpose

Manage household settings.

Sections

User

Household

Properties

Subscription

Notifications

Privacy

---

# Screen Standards

Every screen shall include:

Consistent navigation

Consistent spacing

Accessible typography

Responsive layout

Loading state

Error state

Empty state

---

# Acceptance Criteria

Every screen shall:

Load successfully

Handle network failures gracefully

Support dark mode (future)

Meet accessibility guidelines

Support tablets (future)

---

# Revision History

| Version | Date | Author | Description |
|----------|------|--------|-------------|
| 1.0 | July 2026 | Cory Gleisinger | Initial Screen Specification |
