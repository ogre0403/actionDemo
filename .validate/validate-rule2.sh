#!/bin/bash


svc_num=`kubectl get svc   -l ntcu-k8s=hw2  -o yaml | yq '.items | length'`


if [[ "$svc_num" -ne 1 ]]; then
    echo "client建立的svc數量 $svc_num 不正確"
    exit 1
fi

deployment_num=`kubectl get deployment -l ntcu-k8s=hw2  -o yaml | yq '.items | length'`
if [[ "$deployment_num" -ne 1 ]]; then
    echo "client建立的deployment 數量 $deployment_num 不正確"
    exit 1
fi



cid=`docker ps -f name=control-plane -q`


nodeport=`kubectl get svc  -l ntcu-k8s=hw2  -o jsonpath='{.items[0].spec.ports[0].nodePort}'`


docker exec ${cid} curl 127.0.0.1:${nodeport}