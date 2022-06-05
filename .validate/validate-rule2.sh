#!/bin/bash


# cid=`docker ps -q`
cid=059e9c08bd9c

svc=`for f in ./manifest/*; do cat ${f} | yq '(.|select(.kind == "Service")).metadata.name' ; done`


nodeport=`kubectl get svc ${svc} -o jsonpath='{.spec.ports[0].nodePort}'`


docker exec ${cid} curl 127.0.0.1:${nodeport}