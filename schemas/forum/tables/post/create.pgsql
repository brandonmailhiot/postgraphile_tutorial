-- create enum field type for POST topic
create type forum.post_topic as enum (
  'discussion',
  'inspiration',
  'help',
  'showcase'
);

-- create POST table
create table if not exists forum.post (
  id               serial primary key,
  author_id        integer not null references forum.person(id),
  headline         text not null check (char_length(headline) < 280),
  body             text,
  topic            forum.post_topic,
  created_at       timestamp default now()
);

comment on table forum.post is 'A forum post written by a user.';
comment on column forum.post.id is 'The primary key for the post.';
comment on column forum.post.headline is 'The title written by the user.';
comment on column forum.post.author_id is 'The id of the author user.';
comment on column forum.post.topic is 'The topic this has been posted in.';
comment on column forum.post.body is 'The main body text of our post.';
comment on column forum.post.created_at is 'The time this post was created.';