Tutorial based on https://turkogluc.com/kafka-connect-jdbc-source-connector/

TODO:
- [x] Run all components using docker-compose
- [x] Setup jdbc source and sink connector with simple setup
- [x] Check alter table behavior.
  - If adding new table (from topic in kafka), kc able to create table (set `auto.create` true)
  - If adding new column, kc able to apply it (when `auto.evolve` true). However when new column has default value, the behavior may vary (due to type conversion etc).
  - If rename new column, kc fails.  We have to alter the destination table manually, then restart the connector task.

- [] Check kafka topic directly
- [] Install metrics-reporter to kafka
