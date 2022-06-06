#!/bin/bash

echo ""
echo "測試Client Deployment週期讀取Web Deployment 名字至少五次"
LABEL="ntcu-k8s=hw2"


sa=`for f in ./manifest/*; do cat ${f} | yq '(.|select(.kind == "ServiceAccount")).metadata.name' ; done`


deploy_name=`kubectl get deployments.apps -l ${LABEL} -o yaml | yq '.items[0].metadata.name'`

client_pod=`kubectl get pod -o yaml | yq "(.items[]|select(.spec.serviceAccountName == \"${sa}\")).metadata.name"`

occur_count=`kubectl logs ${client_pod} | grep -o ${deploy_name} -c`

if [[ "$occur_count" -lt 5 ]]; then
    echo "${deploy_name} 出現少於5次"
    exit 1
fi

echo "........ PASS"