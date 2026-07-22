# Engineering Decision Document (EDD)

**Document ID:** EDD-006D  
**Sprint:** 006D  
**Title:** Asset Foundation  
**Status:** Approved for Development  
**Version:** 1.0  
**Owner:** Cory Gleisinger  
**Repository:** safehaven-engineering  
**Last Updated:** July 2026

---

# Purpose

This Engineering Decision Document defines the architecture and engineering decisions for implementing the Asset Foundation within SafeHaven.

Sprint 006D establishes the first production implementation of SafeHaven's core business entity: the Asset.

The Asset becomes the foundation for future capabilities including:

- Ownership Intelligence
- AI Recommendations
- Warranty Management
- Maintenance
- Shopping Assistance
- Marketplace Services
- Smart Home Integration

---

# Problem Statement

Homeowners rarely maintain an accurate, centralized record of what they own.

Information about assets is fragmented across:

- Receipts
- Manuals
- Photos
- Warranties
- Service records
- Email
- Filing cabinets

Without trusted digital asset records, advanced ownership intelligence cannot exist.

Sprint 006D solves this problem by introducing a structured Asset model.

---

# Business Decision

The primary business entity shall be:

**Asset**

rather than

**Inventory Item**

Reasoning:

Assets represent real-world objects owned by homeowners.

Inventory becomes a collection of Assets rather than the core business concept.

This terminology better supports future expansion into:

- Vehicles
- Property Systems
- Smart Devices
- Rental Properties
- Financial Assets
- Insurance
- Future Digital Assets

---

# Architectural Decisions

## Decision 001

Asset is the primary business entity.

Status:

Approved

Reasoning:

Provides long-term scalability while accurately representing homeowner assets.

---

## Decision 002

Every Asset belongs to exactly one Household.

Status:

Approved

Reasoning:

Maintains a clear ownership boundary and simplifies authorization.

---

## Decision 003

All Asset operations require authenticated users.

Status:

Approved

Reasoning:

Protects homeowner information through authenticated access.

---

## Decision 004

Authorization is enforced using Supabase Row Level Security.

Status:

Approved

Reasoning:

Security should be enforced within the database rather than relying solely on the application layer.

---

## Decision 005

Documents are associated with Assets rather than existing independently.

Status:

Approved

Reasoning:

Documents derive value through their relationship to an Asset.

Examples include:

- Receipt
- Warranty
- Manual
- Invoice

---

## Decision 006

Photos are associated with Assets.

Status:

Approved

Reasoning:

Photos become part of the Asset's permanent digital record.

---

## Decision 007

AI does not modify Assets directly.

Status:

Approved

Reasoning:

AI provides recommendations only.

Users approve all permanent changes.

---

# Functional Scope

Sprint 006D includes:

## Asset CRUD

- Create
- Read
- Update
- Archive
- Delete

---

## Asset Metadata

- Name
- Description
- Manufacturer
- Model
- Serial Number
- Purchase Date
- Purchase Price
- Category
- Room
- Notes

---

## Asset Search

Support:

- Keyword Search
- Category Filter
- Room Filter
- Sorting

---

## Asset Photos

Support:

- Upload
- View
- Delete

---

# Out of Scope

The following capabilities are intentionally excluded.

- OCR
- AI Classification
- Warranty Parsing
- Maintenance Scheduling
- Notifications
- Marketplace
- Shopping Assistant
- Smart Devices

---

# Domain Relationships

```text
Household
    │
    ├── Members
    │
    ├── Assets
    │      │
    │      ├── Photos
    │      ├── Documents
    │      ├── Purchase
    │      ├── Warranty
    │      ├── Notes
    │      └── Categories
    │
    └── Settings
```

---

# User Workflow

```text
User Login
      │
      ▼
Dashboard
      │
      ▼
Create Asset
      │
      ▼
Upload Photos
      │
      ▼
Assign Category
      │
      ▼
Assign Room
      │
      ▼
Save Asset
      │
      ▼
Asset Available For Future AI
```

---

# Data Ownership

Each Asset belongs to:

Household

Each supporting record belongs to:

Asset

Examples:

- Photos
- Documents
- Notes
- Future Warranty
- Future Maintenance

---

# Security Considerations

Security requirements include:

- Authentication required
- Row Level Security enabled
- Household isolation
- Secure image storage
- Input validation
- Server-side authorization

---

# Performance Goals

Target performance:

Create Asset:

< 2 seconds

Search Assets:

< 1 second

Dashboard Load:

< 2 seconds

Photo Upload:

< 5 seconds

These goals represent user experience targets and should be monitored as the application evolves.

---

# Risks

Potential risks:

- Future Asset model expansion
- Image storage growth
- Search scalability
- Metadata complexity

Mitigation:

Design the Asset model for extensibility rather than optimizing only for Sprint 006D.

---

# Alternatives Considered

## Option 1

Inventory Item

Rejected

Reason:

Limits future platform expansion.

---

## Option 2

Asset

Approved

Reason:

Represents the business more accurately and supports future capabilities.

---

## Option 3

Separate entities for every object type

Rejected

Reason:

Introduces unnecessary complexity during MVP development.

---

# Acceptance Criteria

Sprint 006D is complete when:

- Asset CRUD is operational
- Search functions correctly
- Categories work
- Room assignment works
- Photos upload successfully
- Assets are isolated by Household
- Security testing passes
- CI/CD passes
- Documentation is complete

---

# Future Impact

Sprint 006D enables:

- AI Recognition
- Warranty Extraction
- Maintenance Engine
- Shopping Assistant
- Marketplace
- Ownership Intelligence
- Smart Home Integration

without requiring redesign of the Asset architecture.

---

# Related Documents

- Sprint 006D Charter
- Domain Model
- Product Decisions
- Architecture Overview
- Architecture Principles
- Sprint 006D User Stories
- Sprint 006D Verification Plan

---

# Revision History

| Version | Date | Author | Description |
|----------|------|--------|-------------|
| 1.0 | July 2026 | Cory Gleisinger | Initial Engineering Decision Document |
