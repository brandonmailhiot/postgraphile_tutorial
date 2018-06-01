-- add extensions
create extension if not exists "pgcrypto";

-- RESET SCHEMAS --

-- forum
drop schema if exists forum cascade;
create schema if not exists forum;

-- forum_private
drop schema if exists forum_private cascade;
create schema if not exists forum_private;