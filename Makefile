DB_SOURCE_PORT=5432
DB_TARGET_PORT=5433

bootstrap-source-sql:
	export PGPASSWORD=postgres; cat sql/source.sql | psql -h localhost -U postgres -d postgres -p $(DB_SOURCE_PORT)

simulate-data-update:
	export PGPASSWORD=postgres; cat sql/simulate-data-update.sql | psql -h localhost -U postgres -d postgres -p $(DB_SOURCE_PORT)

check-source-data:
	export PGPASSWORD=postgres; echo "select * from public.users" | psql -h localhost -U postgres -d postgres -p $(DB_SOURCE_PORT)

TARGET_TABLE=prefix_users
check-target-data:
	export PGPASSWORD=postgres; echo "select * from public.$(TARGET_TABLE)" | psql -h localhost -U postgres -d postgres -p $(DB_TARGET_PORT)

check-target-tables:
	export PGPASSWORD=postgres; echo "\dt" | psql -h localhost -U postgres -d postgres -p $(DB_TARGET_PORT)

drop-source-sql:
	export PGPASSWORD=postgres; echo "DROP table public.users" | psql -h localhost -U postgres -d postgres -p $(DB_SOURCE_PORT)

setup-source-jdbc:
	curl -d @"kafka-connect/jdbc-source.json" \
		-H "Content-Type: application/json" \
		-X POST http://localhost:8083/connectors
update-source-jdbc:
	curl -d @"kafka-connect/jdbc-source-update.json" \
		-H "Content-Type: application/json" \
		-X PUT http://localhost:8083/connectors/source_postgresql/config

setup-sink-jdbc:
	curl -d @"kafka-connect/jdbc-sink.json" \
		-H "Content-Type: application/json" \
		-X POST http://localhost:8083/connectors

delete-source-jdbc:
	curl -X DELETE http://localhost:8083/connectors/source_postgresql
