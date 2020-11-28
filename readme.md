Tutorial based on https://turkogluc.com/kafka-connect-jdbc-source-connector/

TODO:
- [x] Run all components using docker-compose
- [x] Setup jdbc source and sink connector with simple setup
- [x] Check alter table behavior.

  - If adding new table (from topic in kafka), kc able to create table (set `auto.create` true)
  - If adding new column, kc able to apply it (when `auto.evolve` true). However when new column has default value, the behavior may vary (due to type conversion etc).
  - If rename new column, kc fails.  We have to alter the destination table manually, then restart the connector task.

- [x] Check kafka topic directly
- [] Use avro for serde in specific connector
- [] Install metrics-reporter to kafka


## How To
### Build Kafka Connect Image Manually
- With some plugins
```dockerfile
FROM confluentinc/cp-kafka-connect
ENV CONNECT_PLUGIN_PATH="/usr/share/java,/usr/share/confluent-hub-components"
RUN confluent-hub install --no-prompt <plugin-name>
```

### Peek Message From Kafka Topic
- If the kafka network in `db_net`:
```
docker run --net db_net --rm edenhill/kafkacat:1.6.0 \
  -C -o -10 -q \
  -b kafka:9092 \
  -t $(TOPIC)
```

## Useful Resources
- https://www.youtube.com/watch?v=Jkcp28ki82k

