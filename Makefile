DB_SOURCE_PORT=5432
DB_TARGET_PORT=5433

bootstrap-source-sql:
	export PGPASSWORD=postgres; cat sql/source.sql | psql -h localhost -U postgres -d postgres -p $(DB_SOURCE_PORT)
