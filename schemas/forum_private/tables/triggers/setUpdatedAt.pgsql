-- create triggers for updated_at column on all tables in forum schema
create function forum_private.set_updated_at() returns trigger as $$
begin
  new.updated_at := current_timestamp;
  return new;
end;
$$ language plpgsql;

create trigger person_updated_at before update
  on forum.person
  for each row
  execute procedure forum_private.set_updated_at();

create trigger post_updated_at before update
  on forum.post
  for each row
  execute procedure forum_private.set_updated_at();