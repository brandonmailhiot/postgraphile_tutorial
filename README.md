# Instructions

## Start Postgres Server (for MacOS)

Start postgres server with Postgres.app, then connect to the appropriate database in pgAdmin.

## Setup Test Database

Run `init_test.psql` from VS Code with the pgsql extension installed and the postgres URL connection string (e.g. `postgres://127.0.0.1:5432/test_db`) to drop and recreate the test database schemas. 

## Create GraphQL API with PostGraphile

Run the following to create GraphQL and GraphiQL endpoints:
```
postgraphile \
  --connection postgres://forum_postgraphile:xyz@127.0.0.1:5432/test_db \
  --schema forum \
  --default-role forum_anonymous \
  --secret TEST_SECRET \
  --token JWT_TOKEN
```

GraphQL queries can be tested at https://localhost:5000/graphiql

*Note: snake_cased properties in PostgreSQL are camelCased in GraphQL*