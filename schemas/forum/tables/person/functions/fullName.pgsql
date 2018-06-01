-- get first_name + last_name of PERSON
create function forum.person_full_name(person forum.person) returns text as $$
  select person.first_name || ' ' || person.last_name
$$ language sql stable;

comment on function forum.person_full_name(forum.person) is 'A person’s full name which is a concatenation of their first and last name.';
