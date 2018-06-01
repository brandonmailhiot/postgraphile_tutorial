-- seed POST table
insert into forum.post (author_id, headline, body, topic, created_at)
  VALUES(
    (select id from forum.person where id=1),
    'Headline 1',
    'Body 1',
    'discussion',
    now()
  );

insert into forum.post (author_id, headline, body, topic, created_at)
  VALUES(
    (select id from forum.person where id=2),
    'Headline 2',
    'Body 2',
    'help',
    now()
  );

insert into forum.post (author_id, headline, body, topic, created_at)
  VALUES(
    (select id from forum.person where id=3),
    'Headline 3',
    'Body 3',
    'inspiration',
    now()
  );
