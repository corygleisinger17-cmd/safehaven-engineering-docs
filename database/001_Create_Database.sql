-- SafeHaven Database Creation Script
-- Document ID: SH-DB-SQL-001
-- Version: 1.0

create extension if not exists "uuid-ossp";

create table users (
  user_id uuid primary key default uuid_generate_v4(),
  email text unique not null,
  first_name text,
  last_name text,
  subscription_tier text default 'free',
  created_at timestamp default now(),
  updated_at timestamp default now()
);

create table households (
  household_id uuid primary key default uuid_generate_v4(),
  owner_user_id uuid references users(user_id),
  household_name text not null,
  plan_type text default 'free',
  completion_score integer default 0,
  created_at timestamp default now(),
  updated_at timestamp default now()
);

create table household_members (
  member_id uuid primary key default uuid_generate_v4(),
  household_id uuid references households(household_id) on delete cascade,
  user_id uuid references users(user_id) on delete cascade,
  role text default 'member',
  invite_status text default 'accepted',
  created_at timestamp default now()
);

create table properties (
  property_id uuid primary key default uuid_generate_v4(),
  household_id uuid references households(household_id) on delete cascade,
  property_name text not null,
  property_type text default 'primary',
  city text,
  state text,
  year_built integer,
  created_at timestamp default now(),
  updated_at timestamp default now()
);

create table rooms (
  room_id uuid primary key default uuid_generate_v4(),
  property_id uuid references properties(property_id) on delete cascade,
  room_name text not null,
  room_type text,
  photo_url text,
  created_at timestamp default now(),
  updated_at timestamp default now()
);

create table items (
  item_id uuid primary key default uuid_generate_v4(),
  household_id uuid references households(household_id) on delete cascade,
  property_id uuid references properties(property_id) on delete cascade,
  room_id uuid references rooms(room_id) on delete set null,
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
  condition text,
  notes text,
  primary_photo text,
  ai_confidence_score numeric(4,2),
  created_at timestamp default now(),
  updated_at timestamp default now()
);

create table documents (
  document_id uuid primary key default uuid_generate_v4(),
  household_id uuid references households(household_id) on delete cascade,
  item_id uuid references items(item_id) on delete set null,
  document_type text,
  file_url text not null,
  file_type text,
  file_name text,
  extracted_text text,
  upload_status text default 'uploaded',
  created_at timestamp default now()
);

create table reminders (
  reminder_id uuid primary key default uuid_generate_v4(),
  household_id uuid references households(household_id) on delete cascade,
  item_id uuid references items(item_id) on delete set null,
  reminder_type text,
  title text not null,
  description text,
  due_date date,
  repeat_interval text default 'none',
  priority text default 'medium',
  status text default 'open',
  created_at timestamp default now(),
  updated_at timestamp default now()
);

create table maintenance_history (
  maintenance_id uuid primary key default uuid_generate_v4(),
  household_id uuid references households(household_id) on delete cascade,
  item_id uuid references items(item_id) on delete cascade,
  reminder_id uuid references reminders(reminder_id) on delete set null,
  action text not null,
  completed_date date,
  notes text,
  cost numeric(10,2),
  created_at timestamp default now()
);

create table ai_insights (
  insight_id uuid primary key default uuid_generate_v4(),
  household_id uuid references households(household_id) on delete cascade,
  item_id uuid references items(item_id) on delete set null,
  insight_type text,
  message text,
  recommendation text,
  confidence_level text,
  status text default 'new',
  created_at timestamp default now(),
  updated_at timestamp default now()
);

create table search_history (
  search_id uuid primary key default uuid_generate_v4(),
  user_id uuid references users(user_id) on delete cascade,
  household_id uuid references households(household_id) on delete cascade,
  query text not null,
  result_count integer default 0,
  created_at timestamp default now()
);

create table setup_wizard_progress (
  progress_id uuid primary key default uuid_generate_v4(),
  household_id uuid references households(household_id) on delete cascade,
  property_id uuid references properties(property_id) on delete cascade,
  room_type text,
  item_prompt text,
  status text default 'not_started',
  item_id uuid references items(item_id) on delete set null,
  completed_at timestamp,
  updated_at timestamp default now()
);
