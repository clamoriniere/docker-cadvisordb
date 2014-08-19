FROM       google/golang
MAINTAINER Cedric Lamoriniere <cedric.lamoriniere@gmail.com>

## Build cadvisor from source using a recent libcontainer.
## See https://github.com/docker/libcontainer/issues/73.
RUN go get github.com/google/cadvisor

EXPOSE 8080/tcp

CMD        []
ENTRYPOINT ["/gopath/bin/cadvisor","-storage_driver=influxdb","-log_dir=/","-storage_driver_host=192.168.59.103:8086"]

### Usage
### 1. docker build --rm=true --tag='clamoriniere/cadvisor' .
### 2. docker run -dP --volume=/var/run:/var/run:rw --volume=/sys/fs/cgroup:/sys/fs/cgroup:ro --volume=/var/lib/docker:/var/lib/docker:ro --name='cadvisor' clamoriniere/cadvisordb
### 3. open http://"$(boot2docker ip 2>&-)":"$(docker port cadvisor 8080/tcp | cut -d':' -f2)"
