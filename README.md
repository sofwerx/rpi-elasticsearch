# rpi-elasticsearch

[![Build Status](https://travis-ci.org/sofwerx/rpi-elasticsearch.svg)](https://travis-ci.org/sofwerx/rpi-elasticsearch)

This is the Dockerfile behind [sofwerx/rpi-rtl433](https://hub.docker.com/r/sofwerx/rpi-rtl433/) on Docker Hub, setup to autobuild through travis.

This is the Dockerfile behind `sofwerx/rpi-elasticsearch` on Docker Hub, setup to autobuild through travis.

This runs an ElasticSearch service on a Raspberry-Pi.

The parent project to this is [sofwerx/rpi-tpms](https://github.com/sofwerx/rpi-tpms). There you will find the docker-compose that uses this container.

Here is the docker-compose snippet of this container image in use:

  elasticsearch:
    image: sofwerx/rpi-elasticsearch:latest
    container_name: elasticsearch
    hostname: elasticsearch
    restart: always
    ulimits:
      memlock:
        soft: -1
        hard: -1
      nofile:
        soft: 65536
        hard: 65536
    volumes:
      - elasticsearch-data:/usr/share/elasticsearch/data
    ports:
      - "9200:9200"
      - "9300:9300"
    depends_on:
      - multiarch
    logging:
      driver: json-file
      options:
        max-size: "20k"

