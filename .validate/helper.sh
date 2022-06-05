#!/bin/bash


sleep 10

# # # todo: wait for complete
# for i in {1..60}; do \
# 	echo $$i ; \
# 	if [ -n kubectl get deployments.apps $(deployment) -o yaml | yq .status.readyReplicas==.status.replicas = 'true'] ; \
# 	then ; \ 
# 		break ;\
# 	fi \
# done