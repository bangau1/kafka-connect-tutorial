DB_SOURCE_PORT=5432
DB_TARGET_PORT=5433

bootstrap-source-sql:
	export PGPASSWORD=postgres; cat sql/source.sql | psql -h localhost -U postgres -d postgres -p $(DB_SOURCE_PORT)

kafka-connect-setup-source-jdbc:
	curl -d @"kafka-connect/jdbc-source.json" \
		-H "Content-Type: application/json" \
		-X POST http://localhost:8083/connectors

kafka-connect-delete-source-jdbc:
	curl -X DELETE http://localhost:8083/connectors/source_postgresql

