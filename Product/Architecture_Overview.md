# SafeHaven Architecture Overview

**Version:** 1.0  
**Status:** Active  
**Owner:** Cory Gleisinger  
**Repository:** safehaven-engineering  
**Last Updated:** July 2026

---

# Purpose

This document provides a high-level overview of the SafeHaven system architecture.

It is intended to help engineers quickly understand the major components of the platform, how they interact, and the architectural patterns used throughout the application.

Detailed implementation information is documented within Engineering Decision Documents (EDD), Architecture Decision Records (ADR), and individual subsystem documentation.

---

# System Vision

SafeHaven is designed as a modern cloud-native SaaS platform that enables homeowners to digitally organize, maintain, and protect everything they own.

The platform combines:

- Modern Web Technologies
- Cloud Infrastructure
- Artificial Intelligence
- Secure Data Storage
- Intelligent Automation

while maintaining homeowner trust through transparency, security, and user control.

---

# High-Level Architecture

```text
                    +---------------------------+
                    |        Web Browser        |
                    |        (User UI)          |
                    +------------+--------------+
                                 |
                                 |
                         HTTPS / Auth
                                 |
                                 ▼
                    +---------------------------+
                    |        Lovable App        |
                    |  (React / TypeScript UI)  |
                    +------------+--------------+
                                 |
                                 |
                         Supabase Client
                                 |
             +-------------------+-------------------+
             |                                       |
             ▼                                       ▼
+--------------------------+         +-----------------------------+
|     Supabase Auth        |         |      Supabase Database      |
| Authentication & Users   |         | PostgreSQL + RLS + Storage  |
+-------------+------------+         +-------------+---------------+
              |                                        |
              |                                        |
              ▼                                        ▼
     Authentication                        Tables / RPC / Storage
                                                      |
                                                      ▼
                                    +-------------------------------+
                                    |      Business Logic Layer     |
                                    |      PostgreSQL Functions     |
                                    +---------------+---------------+
                                                    |
                                                    ▼
                                     +------------------------------+
                                     |      AI Service Layer        |
                                     | Classification / OCR / NLP   |
                                     +---------------+--------------+
                                                     |
                                                     ▼
                                       AI Recommendations Returned
                                                     |
                                                     ▼
                                                 User Approval
```

---

# Core Technology Stack

## Frontend

Platform:

- Lovable

Framework:

- React
- TypeScript

Responsibilities:

- User Interface
- User Experience
- Authentication
- Forms
- Search
- Dashboards

---

## Backend

Platform:

- Supabase

Components:

- PostgreSQL
- Authentication
- Row Level Security
- Storage
- Edge Functions (future)
- Realtime (future)

Responsibilities:

- Data Storage
- Authentication
- Authorization
- Business Logic
- API

---

## Database

Engine:

PostgreSQL

Architecture:

- Relational
- Normalized
- Transactional

Primary Responsibilities:

- Data Integrity
- Relationships
- Constraints
- Security
- Stored Procedures (RPC)

---

## Authentication

Provider:

Supabase Auth

Authentication Methods:

- Email / Password
- OAuth (future)

Security Features:

- JWT
- Row Level Security
- Session Management

---

## Storage

Platform:

Supabase Storage

Primary Assets:

- Photos
- Manuals
- Receipts
- Warranty Documents
- Attachments

---

## Artificial Intelligence

Primary Responsibilities:

- Item Recognition
- OCR
- Warranty Detection
- Manual Understanding
- Search Assistance
- Future Recommendations

Important Principle:

AI never modifies user data directly.

AI provides recommendations.

Users approve changes.

---

# Architectural Layers

## Presentation Layer

Responsibilities:

- User Interface
- Navigation
- User Interaction
- Input Validation

Technology:

- React
- TypeScript
- Lovable

---

## Application Layer

Responsibilities:

- Business Rules
- Workflow
- Validation
- API Calls

---

## Business Logic Layer

Responsibilities:

- RPC Functions
- Stored Procedures
- Data Validation
- Transaction Management

Example:

```
classify_item()

approve_suggestion()

create_Asset _item()

archive_item()
```

Business rules should exist here whenever possible.

---

## Persistence Layer

Responsibilities:

- PostgreSQL
- Relationships
- Constraints
- Indexes
- Row Level Security

---

# Core Domains

The application is organized into independent domains.

## Household

Responsible for:

- Household Management
- Membership
- Permissions

---

## Asset 

Responsible for:

- Asset  Items
- Categories
- Locations
- Ownership

---

## Documents

Responsible for:

- Receipts
- Manuals
- Warranties
- Photos

---

## Maintenance

Responsible for:

- Service History
- Maintenance Tasks
- Scheduling
- Reminders

---

## AI

Responsible for:

- Recognition
- Classification
- Search
- Recommendations

---

## Marketplace (Future)

Responsible for:

- Contractors
- Quotes
- Product Replacement
- Service Scheduling

---

# Security Model

SafeHaven follows a defense-in-depth strategy.

Security layers include:

- Authentication
- Authorization
- Row Level Security
- Database Constraints
- API Validation
- Secure Storage

The database should reject invalid operations even if the application layer fails.

---

# Data Ownership Model

The hierarchy is intentionally simple.

```text
Household
    │
    ├── Members
    │
    ├── Asset 
    │
    ├── Documents
    │
    ├── Maintenance
    │
    └── Settings
```

Households own all data.

Users are members of households.

---

# AI Workflow

SafeHaven AI always follows the same lifecycle.

```text
User Uploads Data
        │
        ▼
AI Analysis
        │
        ▼
Recommendation Created
        │
        ▼
User Review
        │
        ▼
User Approval
        │
        ▼
Database Updated
```

No AI recommendation bypasses user approval.

---

# Engineering Standards

Every subsystem should be:

- Modular
- Secure
- Testable
- Observable
- Documented
- Independently deployable where practical

---

# Deployment Architecture

Current Environment

Frontend

- Lovable

Backend

- Supabase

Database

- PostgreSQL

Storage

- Supabase Storage

Authentication

- Supabase Auth

CI/CD

- GitHub Actions

---

# Future Expansion

The architecture is designed to support future capabilities including:

- Native Mobile Applications
- Smart Home Integrations
- Voice Assistants
- IoT Devices
- Marketplace Services
- AI Agents
- Third-Party Integrations
- Insurance Platforms

These additions should extend the existing architecture rather than require redesign.

---

# Related Documents

- Product Roadmap
- Engineering Documentation Standard
- Product Decisions
- Architecture Principles
- Architecture Decision Records (ADR)
- Engineering Decision Documents (EDD)

---

# Revision History

| Version | Date | Author | Description |
|----------|------|--------|-------------|
| 1.0 | July 2026 | Cory Gleisinger | Initial Architecture Overview |
