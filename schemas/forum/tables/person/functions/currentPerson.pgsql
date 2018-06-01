-- get current PERSON based on JWT
create function forum.current_person() returns forum.person as $$
  select *
  from forum.person
  where id = current_setting('jwt.claims.person_id')::integer
$$ language sql stable;

comment on function forum.current_person() is 'Gets the person who was identified by our JWT.';