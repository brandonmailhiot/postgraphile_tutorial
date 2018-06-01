-- reset all schemas
\i schemas/reset.pgsql;

-- create and seed forum tables
\i schemas/forum/tables/person/create.pgsql
\i schemas/forum/tables/person/seed.pgsql
\i schemas/forum/tables/post/create.pgsql
\i schemas/forum/tables/post/seed.pgsql

-- change function execution permissions
alter default privileges revoke execute on functions from public;

-- create forum function definitions, callable in GraphQL query
\i schemas/forum/tables/person/functions/fullName.pgsql
\i schemas/forum/tables/post/functions/summary.pgsql
\i schemas/forum/tables/person/functions/latestPost.pgsql
\i schemas/forum/tables/post/functions/searchPosts.pgsql

-- migrate POST and PERSON tables to contain updated_at COLUMN
alter table forum.person add column updated_at timestamp default now();
alter table forum.post add column updated_at timestamp default now();

-- create forum_private tables
\i schemas/forum_private/tables/person_account/create.pgsql

-- create forum_private triggers
\i schemas/forum_private/tables/triggers/setUpdatedAt.pgsql

-- registration function for PERSON
\i schemas/forum/tables/person/functions/registerPerson.pgsql

-- authenticate PERSON_ACCOUNT and create JWT, return null if error
\i schemas/forum/tables/person/functions/authenticate.pgsql

-- get current PERSON based on JWT
\i schemas/forum/tables/person/functions/currentPerson.pgsql

-- create roles
\i roles/create.pgsql

-- grant roles
\i roles/grant.pgsql

-- create row-level security policies
\i roles/policy.pgsql