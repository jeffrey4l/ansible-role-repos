#!/bin/bash

set -ex

CUR_DIR=$(dirname $0)

container_name=$(docker run -d centos:7 sleep infinity)

function cleanup(){
    docker rm -f "$container_name"
}

trap cleanup EXIT

ansible-playbook -i "$container_name," "${CUR_DIR}/site.yml" -D -v
