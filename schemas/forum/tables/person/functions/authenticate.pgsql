-- composite type for JWT authentication
create type forum.jwt_token as (
  role text,
  person_id integer
);

-- authenticate to PERSON_ACCOUNT and create JWT, return null if error
create function forum.authenticate(
  email text,
  password text
) returns forum.jwt_token as $$
declare
  account forum_private.person_account;
begin
  select a.* into account
  from forum_private.person_account as a
  where a.email = $1;

  if account.password_hash = crypt(password, account.password_hash) then
    return ('forum_person', account.person_id)::forum.jwt_token;
  else
    return null;
  end if;
end;
$$ language plpgsql strict security definer;

comment on function forum.authenticate(text, text) is 'Creates a JWT token that will securely identify a person and give them certain permissions.';