# EDD-001: Intelligence Engine

> **Version:** 1.0  
> **Status:** Engineering Design Document  
> **Audience:** Engineering, Architecture, QA  
> **Last Updated:** July 2026

---

# Purpose

The Intelligence Engine transforms raw ownership information into structured, explainable, and continuously improving knowledge.

It is the core system that allows SafeHaven to move beyond storing information and begin understanding ownership.

The engine does not replace homeowner decisions.

It assists them.

---

# Design Goals

The Intelligence Engine must always be:

- Explainable
- Deterministic whenever possible
- Extensible
- Secure
- Reviewable
- Auditable
- Historically accurate

Recommendations may evolve.

User-owned facts must remain trustworthy.

---

# The Intelligence Pipeline

Every asset follows the same lifecycle.

```text
Asset Created
        │
        ▼
Normalization
        │
        ▼
Reference Matching
        │
        ▼
Evidence Collection
        │
        ▼
Scoring
        │
        ▼
Suggestion Generation
        │
        ▼
User Review
        │
        ▼
Accepted Intelligence
        │
        ▼
Future Enrichment
```

Each stage has a single responsibility.

---

# Stage 1 — Asset Creation

The engine begins with information supplied by the homeowner.

Typical inputs include:

- Asset name
- Manufacturer (optional)
- Model number
- Serial number
- Purchase date
- Purchase price
- Room
- Property
- Notes
- Photos
- Documents

At this stage the asset contains facts.

No intelligence has been generated yet.

---

# Stage 2 — Normalization

Before any matching occurs, all inputs are normalized.

Examples include:

- lowercase conversion
- whitespace cleanup
- punctuation normalization
- token cleanup
- alias normalization

Normalization allows deterministic matching against reference data.

Example:

```
"  Dewalt  "

↓

"dewalt"
```

---

# Stage 3 — Reference Matching

Normalized values are compared against curated platform knowledge.

Current reference domains include:

- Categories
- Item Types
- Manufacturers
- Manufacturer Aliases
- Item Type Aliases
- Manufacturer ↔ Item Type relationships

Future domains may include:

- Compatible accessories
- Consumables
- Maintenance templates
- Product families
- Replacement parts

Reference data represents platform knowledge.

It is never generated from user input.

---

# Stage 4 — Evidence Collection

Every possible match generates evidence.

Examples:

Manufacturer evidence

- Exact manufacturer match
- Alias match
- Model pattern
- Asset name
- Notes
- Document extraction

Item Type evidence

- Asset name
- Category keywords
- Manufacturer relationship
- Alias match
- Manual extraction
- Receipt extraction

Every recommendation should have supporting evidence.

---

# Stage 5 — Scoring

Evidence is weighted according to confidence.

Example:

| Evidence | Weight |
|----------|--------|
| Exact manufacturer | Very High |
| Alias match | High |
| Model pattern | High |
| Asset name | Medium |
| Notes | Low |

Scores remain configurable.

Weights should evolve independently of user data.

---

# Stage 6 — Suggestion Generation

The engine generates recommendations.

Current suggestion types include:

- Manufacturer
- Item Type
- Category

Future suggestion types may include:

- Maintenance schedule
- Compatible accessories
- Consumables
- Replacement windows
- Expected lifespan
- Repair guidance

Suggestions are persisted.

They are never automatically accepted.

---

# Stage 7 — User Review

Homeowners remain the final authority.

Users may:

- Accept
- Reject
- Correct
- Ignore

Accepted intelligence becomes trusted platform knowledge.

Rejected suggestions become valuable learning history.

---

# Stage 8 — Accepted Intelligence

Accepted information is stored separately from suggestions.

Examples include:

- Accepted Manufacturer
- Accepted Item Type
- Accepted Category

Separating accepted intelligence from suggestions allows the engine to continue improving without modifying verified information.

---

# Stage 9 — Future Enrichment

The engine should revisit assets as new knowledge becomes available.

Examples include:

- Newly supported manufacturers
- Improved matching rules
- Additional compatibility data
- Better maintenance guidance

Previously accepted ownership facts remain unchanged unless the homeowner approves updates.

---

# Reference Data

The Intelligence Engine depends on curated platform knowledge.

Current domains include:

```text
Categories
      │
      ▼
Item Types
      │
      ▼
Manufacturers
      │
      ▼
Manufacturer ↔ Item Type Relationships
```

Reference data should be:

- curated
- versioned
- migration managed
- normalized
- deterministic

Reference data is platform knowledge.

It is not homeowner data.

---

# Confidence Levels

Every suggestion includes confidence.

Current confidence bands:

- Very High
- High
- Medium
- Low
- Insufficient

Confidence should always be explainable.

The engine must never return unexplained confidence.

---

# Lifecycle States

Suggestions progress through a lifecycle.

```text
Generated
      │
      ▼
Reviewed
 ┌────┴────┐
 │         │
 ▼         ▼
Accepted Rejected
      │
      ▼
Superseded
```

Historical states are never discarded.

---

# Preservation Rules

The Intelligence Engine must preserve homeowner trust.

Therefore:

Accepted facts are never silently overwritten.

Historical suggestions remain available.

Corrections remain auditable.

Recommendation history remains intact.

Trust is more valuable than convenience.

---

# Security

The engine must verify:

- household ownership
- asset existence
- asset state
- authorization
- row-level security

All intelligence generation must respect household boundaries.

---

# Future Intelligence Domains

The engine is intentionally designed to expand.

Future domains include:

## Ownership

- Ownership cost
- Depreciation
- Insurance readiness

## Maintenance

- Predictive maintenance
- Seasonal recommendations
- Repair guidance

## Compatibility

- Batteries
- Filters
- Accessories
- Consumables
- Replacement parts

## Projects

- Tool requirements
- Material planning
- Shopping recommendations

## Home Intelligence

- Energy optimization
- Water systems
- HVAC health
- Appliance lifecycle

The architecture should support new domains without redesigning existing ones.

---

# AI Integration

Artificial intelligence enhances the engine.

It does not replace it.

AI should:

- summarize
- extract
- classify
- recommend
- explain

AI should not:

- silently overwrite facts
- invent ownership information
- bypass user approval
- replace deterministic knowledge

AI earns trust by working alongside structured data.

---

# Success Criteria

The Intelligence Engine succeeds when:

Recommendations become more accurate over time.

Homeowners trust recommendations.

Reference knowledge grows.

Accepted information remains stable.

Every asset becomes more valuable as it ages.

That is the defining characteristic of SafeHaven's intelligence.

---

# Guiding Statement

> **The Intelligence Engine exists to transform ownership information into trustworthy understanding while ensuring the homeowner always remains in control.**
