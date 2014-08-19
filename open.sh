#!/bin/sh
open http://"$(boot2docker ip 2>&-)":"$(docker port cadvisor 8080/tcp | cut -d':' -f2)"

