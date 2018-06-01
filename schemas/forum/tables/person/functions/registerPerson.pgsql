-- register a PERSON with public and private data
create function forum.register_person(
  first_name text,
  last_name text,
  email text,
  password text
) returns forum.person as $$
declare
  person forum.person;
begin
  insert into forum.person (first_name, last_name) values
    (first_name, last_name)
    returning * into person;

  insert into forum_private.person_account (person_id, email, password_hash) values
    (person.id, email, crypt(password, gen_salt('bf')));

  return person;
end;
$$ language plpgsql strict security definer;

comment on function forum.register_person(text, text, text, text) is 'Registers a single user and creates an account in our forum.';
