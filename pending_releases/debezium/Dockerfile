# https://strimzi.io/blog/2020/01/27/deploying-debezium-with-kafkaconnector-resource/
FROM strimzi/kafka:0.18.0-kafka-2.5.0
MAINTAINER dieunb@gmail.com

USER root:root

ENV KAFKA_CONNECT_PLUGINS_DIR="${KAFKA_HOME}/plugins/"
ENV CONFLUENT_HUB_CLIENT_FILE="confluent-hub-client-latest.tar.gz"
ENV DEBEZIUM_CONNECTOR_POSTGRES="debezium-connector-postgres"
ENV DEBEZIUM_CONNECTOR_POSTGRES_VERSION="1.2.0.Final"
ENV DEBEZIUM_CONNECTOR_POSTGRES_ZIP_FILE="${DEBEZIUM_CONNECTOR_POSTGRES}-${DEBEZIUM_CONNECTOR_POSTGRES_VERSION}-plugin.tar.gz"
ENV DEBEZIUM_CONNECTOR_POSTGRES_URL="https://repo1.maven.org/maven2/io/debezium/${DEBEZIUM_CONNECTOR_POSTGRES}/${DEBEZIUM_CONNECTOR_POSTGRES_VERSION}/${DEBEZIUM_CONNECTOR_POSTGRES_ZIP_FILE}"
ENV CONFLUENTINC_KAFKA_CONNECT_S3="confluentinc/kafka-connect-s3:5.5.1"
ENV CONFLUENTINC_KAFKA_CONNECT_JDBC="confluentinc/kafka-connect-jdbc:5.5.1"

RUN curl -o $DEBEZIUM_CONNECTOR_POSTGRES_ZIP_FILE $DEBEZIUM_CONNECTOR_POSTGRES_URL && \
  tar -xvf $DEBEZIUM_CONNECTOR_POSTGRES_ZIP_FILE && \
  rm -f $DEBEZIUM_CONNECTOR_POSTGRES_ZIP_FILE

RUN mkdir -p $KAFKA_CONNECT_PLUGINS_DIR/debezium && \
  mv ./$DEBEZIUM_CONNECTOR_POSTGRES/ $KAFKA_CONNECT_PLUGINS_DIR/debezium/

RUN curl -o $CONFLUENT_HUB_CLIENT_FILE http://client.hub.confluent.io/$CONFLUENT_HUB_CLIENT_FILE && \
	tar -xvf $CONFLUENT_HUB_CLIENT_FILE && rm $CONFLUENT_HUB_CLIENT_FILE

RUN touch $KAFKA_HOME/config/confluentinc.properties && \
  bin/confluent-hub install $CONFLUENTINC_KAFKA_CONNECT_JDBC --no-prompt --component-dir $KAFKA_CONNECT_PLUGINS_DIR --worker-configs $KAFKA_HOME/config/confluentinc.properties && \
  bin/confluent-hub install $CONFLUENTINC_KAFKA_CONNECT_S3 --no-prompt --component-dir $KAFKA_CONNECT_PLUGINS_DIR --worker-configs $KAFKA_HOME/config/confluentinc.properties

USER 1001
