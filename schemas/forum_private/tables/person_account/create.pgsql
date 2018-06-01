-- create PERSON_ACCOUNT on forum_private schema
create table forum_private.person_account (
  person_id        serial primary key references forum.person(id) on delete cascade,
  email            text not null unique check (email ~* '^.+@.+\..+$'),
  password_hash    text not null
);

comment on table forum_private.person_account is 'Private information about a person’s account.';
comment on column forum_private.person_account.person_id is 'The id of the person associated with this account.';
comment on column forum_private.person_account.email is 'The email address of the person.';
comment on column forum_private.person_account.password_hash is 'An opaque hash of the person’s password.';
