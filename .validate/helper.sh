#!/bin/bash

sa=`for f in ./manifest/*; do cat ${f} | yq '(.|select(.kind == "ServiceAccount")).metadata.name' ; done`

deployment=`for f in ./manifest/*; do cat ${f} | yq "(.|select(.spec.template.spec.serviceAccountName == \"${sa}\")).metadata.name" ; done`

echo ""
echo "等待Client Pod部署完成"

ready="false"

for i in {1..60}; do 
    ready=`kubectl get deployments.apps ${deployment} >/dev/null  2>&1  && kubectl get deployments.apps ${deployment} -o yaml |  yq .status.readyReplicas==.status.replicas`

	if [ "$ready" == "true" ]; then 
		break
	fi 
    echo "deployment ${deployment} not ready, sleep 1 sec"
    sleep 1
done