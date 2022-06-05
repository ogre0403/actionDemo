IMG ?= ntcu/k8s
TAG ?= hw2
kind_name ?= kind


prepare: 
	docker build -t $(IMG):$(TAG) . 
	kind load docker-image $(IMG):$(TAG) --name $(kind_name)

run: prepare
	kubectl apply -f manifest
	@bash .validate/helper.sh

all: run
	# @bash .validate/validate-rule1.sh
	# @bash .validate/validate-rule2.sh
	# kubectl delete -f manifest
	



