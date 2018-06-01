-- get first 50 chars of POST 
create function forum.post_summary(
  post forum.post,
  length int default 50,
  omission text default '…'
) returns text as $$
  select case
    when post.body is null then null
    else substr(post.body, 0, length) || omission
  end
$$ language sql stable;

comment on function forum.post_summary(forum.post, int, text) is 'A truncated version of the post body for summaries.';
