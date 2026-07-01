/*
SafeHaven Migration 006
Purpose: Add Row Level Security write policies for MVP creation flow.
*/

-----------------------------------------------------------
-- Profiles
-----------------------------------------------------------

create policy "Users can insert own profile"
on public.profiles
for insert
with check (profile_id = auth.uid());

-----------------------------------------------------------
-- Households
-----------------------------------------------------------

create policy "Users can create households"
on public.households
for insert
with check (owner_user_id = auth.uid());

create policy "Owners can update households"
on public.households
for update
using (owner_user_id = auth.uid());

-----------------------------------------------------------
-- Household Members
-----------------------------------------------------------

create policy "Users can create own household membership"
on public.household_members
for insert
with check (user_id = auth.uid());

-----------------------------------------------------------
-- Properties
-----------------------------------------------------------

create policy "Members can create properties"
on public.properties
for insert
with check (
  household_id in (
    select household_id
    from public.household_members
    where user_id = auth.uid()
  )
);

create policy "Members can update properties"
on public.properties
for update
using (
  household_id in (
    select household_id
    from public.household_members
    where user_id = auth.uid()
  )
);

-----------------------------------------------------------
-- Rooms
-----------------------------------------------------------

create policy "Members can create rooms"
on public.rooms
for insert
with check (
  property_id in (
    select p.property_id
    from public.properties p
    join public.household_members hm
      on hm.household_id = p.household_id
    where hm.user_id = auth.uid()
  )
);

create policy "Members can update rooms"
on public.rooms
for update
using (
  property_id in (
    select p.property_id
    from public.properties p
    join public.household_members hm
      on hm.household_id = p.household_id
    where hm.user_id = auth.uid()
  )
);

-----------------------------------------------------------
-- Items
-----------------------------------------------------------

create policy "Members can create items"
on public.items
for insert
with check (
  household_id in (
    select household_id
    from public.household_members
    where user_id = auth.uid()
  )
);

create policy "Members can update items"
on public.items
for update
using (
  household_id in (
    select household_id
    from public.household_members
    where user_id = auth.uid()
  )
);
