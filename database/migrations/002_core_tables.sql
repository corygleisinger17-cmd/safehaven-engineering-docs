/*
SafeHaven Migration 002
File: /database/migrations/002_core_tables.sql
Purpose: Create core SafeHaven application tables.
*/

create table if not exists public.profiles (
  profile_id uuid primary key references auth.users(id) on delete cascade,
  email citext unique,
  first_name text,
  last_name text,
  subscription_tier text not null default 'free',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.households (
  household_id uuid primary key default gen_random_uuid(),
  owner_user_id uuid not null references auth.users(id) on delete cascade,
  household_name text not null,
  plan_type text not null default 'free',
  completion_score integer not null default 0 check (completion_score >= 0 and completion_score <= 100),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.household_members (
  member_id uuid primary key default gen_random_uuid(),
  household_id uuid not null references public.households(household_id) on delete cascade,
  user_id uuid not null references auth.users(id) on delete cascade,
  role text not null default 'member' check (role in ('owner', 'admin', 'member')),
  invite_status text not null default 'accepted' check (invite_status in ('pending', 'accepted', 'declined')),
  created_at timestamptz not null default now(),
  unique (household_id, user_id)
);

create table if not exists public.properties (
  property_id uuid primary key default gen_random_uuid(),
  household_id uuid not null references public.households(household_id) on delete cascade,
  property_name text not null,
  property_type text not null default 'primary',
  city text,
  state text,
  year_built integer,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.rooms (
  room_id uuid primary key default gen_random_uuid(),
  property_id uuid not null references public.properties(property_id) on delete cascade,
  room_name text not null,
  room_type text,
  photo_url text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.items (
  item_id uuid primary key default gen_random_uuid(),
  household_id uuid not null references public.households(household_id) on delete cascade,
  property_id uuid not null references public.properties(property_id) on delete cascade,
  room_id uuid references public.rooms(room_id) on delete set null,
  item_name text not null,
  category text,
  brand text,
  model_number text,
  serial_number text,
  purchase_date date,
  purchase_price numeric(10,2),
  vendor text,
  warranty_start date,
  warranty_expiration date,
  item_condition text,
  notes text,
  primary_photo_url text,
  ai_confidence_score numeric(4,2),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
