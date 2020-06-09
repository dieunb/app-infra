# https://strimzi.io/blog/2020/01/27/deploying-debezium-with-kafkaconnector-resource/
FROM strimzi/kafka:0.18.0-kafka-2.5.0
USER root:root
RUN mkdir -p /opt/kafka/plugins/debezium
COPY ./debezium-connector-postgres/ /opt/kafka/plugins/debezium/
USER 1001
