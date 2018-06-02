-- enable row level security on tables
alter table forum.person enable row level security;
alter table forum.post enable row level security;

create policy select_person on forum.person for select
  using (true);

create policy select_post on forum.post for select
  using (true);

-- can only update current person's row
create policy update_person on forum.person for update to forum_person
  using (id = current_setting('jwt.claims.person_id')::integer);

-- can only delete current person's row
create policy delete_person on forum.person for delete to forum_person
  using (id = current_setting('jwt.claims.person_id')::integer);

-- can only insert on current person's post row
create policy insert_post on forum.post for insert to forum_person
  with check (author_id = current_setting('jwt.claims.person_id')::integer);

-- can only update on current person's post row
create policy update_post on forum.post for update to forum_person
  using (author_id = current_setting('jwt.claims.person_id')::integer);

-- can only delete on current person's post row
create policy delete_post on forum.post for delete to forum_person
  using (author_id = current_setting('jwt.claims.person_id')::integer);