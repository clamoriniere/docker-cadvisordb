#!/bin/sh

docker run -dP --volume=/var/run:/var/run:rw --volume=/sys/fs/cgroup:/sys/fs/cgroup:ro --volume=/var/lib/docker:/var/lib/docker:ro -p 8010:8080 --name='cadvisordb' clamoriniere/cadvisordb
