-- find POSTs with matching body or headline
create function forum.search_posts(search text) returns setof forum.post as $$
  select post.*
  from forum.post as post
  where post.headline ilike ('%' || search || '%') or post.body ilike ('%' || search || '%')
$$ language sql stable;

comment on function forum.search_posts(text) is 'Returns posts containing a given search term.';
