/*
SafeHaven Migration 003
File: /database/migrations/003_supporting_tables.sql
Purpose: Create supporting tables for documents, reminders, maintenance, AI insights, search, and setup wizard progress.
*/

create table if not exists public.documents (
  document_id uuid primary key default gen_random_uuid(),
  household_id uuid not null references public.households(household_id) on delete cascade,
  item_id uuid references public.items(item_id) on delete set null,
  document_type text not null check (document_type in ('receipt', 'manual', 'warranty', 'invoice', 'photo', 'other')),
  file_url text not null,
  file_type text,
  file_name text,
  extracted_text text,
  upload_status text not null default 'uploaded' check (upload_status in ('uploaded', 'processing', 'complete', 'failed')),
  created_at timestamptz not null default now()
);

create table if not exists public.reminders (
  reminder_id uuid primary key default gen_random_uuid(),
  household_id uuid not null references public.households(household_id) on delete cascade,
  item_id uuid references public.items(item_id) on delete set null,
  reminder_type text not null default 'custom' check (reminder_type in ('maintenance', 'warranty', 'custom')),
  title text not null,
  description text,
  due_date date,
  repeat_interval text not null default 'none',
  priority text not null default 'medium' check (priority in ('low', 'medium', 'high')),
  status text not null default 'open' check (status in ('open', 'done', 'snoozed')),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.maintenance_history (
  maintenance_id uuid primary key default gen_random_uuid(),
  household_id uuid not null references public.households(household_id) on delete cascade,
  item_id uuid not null references public.items(item_id) on delete cascade,
  reminder_id uuid references public.reminders(reminder_id) on delete set null,
  action text not null,
  completed_date date,
  notes text,
  cost numeric(10,2),
  created_at timestamptz not null default now()
);

create table if not exists public.ai_insights (
  insight_id uuid primary key default gen_random_uuid(),
  household_id uuid not null references public.households(household_id) on delete cascade,
  item_id uuid references public.items(item_id) on delete set null,
  insight_type text,
  message text not null,
  recommendation text,
  confidence_level text check (confidence_level in ('low', 'medium', 'high')),
  status text not null default 'new' check (status in ('new', 'accepted', 'dismissed')),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.search_history (
  search_id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  household_id uuid not null references public.households(household_id) on delete cascade,
  query text not null,
  result_count integer not null default 0,
  created_at timestamptz not null default now()
);

create table if not exists public.setup_wizard_progress (
  progress_id uuid primary key default gen_random_uuid(),
  household_id uuid not null references public.households(household_id) on delete cascade,
  property_id uuid references public.properties(property_id) on delete cascade,
  room_type text,
  item_prompt text,
  status text not null default 'not_started' check (status in ('not_started', 'added', 'skipped')),
  item_id uuid references public.items(item_id) on delete set null,
  completed_at timestamptz,
  updated_at timestamptz not null default now()
);
