-- grant roles
grant forum_anonymous to forum_postgraphile;
grant forum_person to forum_postgraphile;

grant usage on schema forum to forum_anonymous, forum_person;

grant select on table forum.person to forum_anonymous, forum_person;
grant update, delete on table forum.person to forum_person;

grant select on table forum.post to forum_anonymous, forum_person;
grant insert, update, delete on table forum.post to forum_person;

-- not necessary with UUIDs, because they can be generated on the client side (non-sequential)
grant usage on sequence forum.post_id_seq to forum_person;

-- PERSON functions
grant execute on function forum.person_full_name(forum.person) to forum_anonymous, forum_person;
grant execute on function forum.person_latest_post(forum.person) to forum_anonymous, forum_person;
grant execute on function forum.authenticate(text, text) to forum_anonymous, forum_person;
grant execute on function forum.current_person() to forum_anonymous, forum_person;

-- POST functions
grant execute on function forum.search_posts(text) to forum_anonymous, forum_person;
grant execute on function forum.post_summary(forum.post, integer, text) to forum_anonymous, forum_person;

grant execute on function forum.register_person(text, text, text, text) to forum_anonymous;