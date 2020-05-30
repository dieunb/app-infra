Debezium Kafka Connect
=====

[Debezium Kafka Connect](http://debezium.io/docs/tutorial/) is a server that can monitor a postgreSQL database and send the events to a kafka-server.

Configuration
-------------

The following tables lists the configurable parameters of the Kafka-Connect chart and their default values.

| Parameter                  | Description                         | Default                                                 |
|----------------------------|-------------------------------------|---------------------------------------------------------|
| `image.repository`         | Kafka-Connect image name            | `debezium/connect`                                      |
| `image.tag`                | Kafka-Connect image tag.            | `0.10`                                                  |
| `image.pullPolicy`         | Image pull policy                   | `IfNotPresent`                                          |
| `service.name`             | Kubernetes service name             | `connector`                                             |
| `service.type`             | Kubernetes service type             | `ClusterIP`                                             |
| `service.internalPort`     | Kubernetes service internal port    | `8083`                                                  |
| `service.externalPort`     | Kubernetes service externam port    | `8083`                                                  |
| `config.groupId`           | Kafka group Id                      | `debezium`                                              |
| `config.configStorageTopic`| Topic to store the configs          | `my_connect_configs`                                    |
| `config.offsetStorageTopic`| Topic to store the offsets          | `my_connect_offsets`                                    |
| `config.bootstrapServers`  | Kafka server host                   | `kafka:9092`                                            |
| `resources`                | CPU/Memory resource requests/limits |                                                         |

You can specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. Read more from [Debezium](https://hub.docker.com/r/debezium/)

