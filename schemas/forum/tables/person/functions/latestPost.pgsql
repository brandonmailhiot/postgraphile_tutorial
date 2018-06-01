-- get most recent POST by author_id
create function forum.person_latest_post(person forum.person) returns forum.post as $$
  select post.*
  from forum.post as post
  where post.author_id = person.id
  order by created_at desc
  limit 1
$$ language sql stable;

comment on function forum.person_latest_post(forum.person) is 'Gets the latest post written by the person.';
