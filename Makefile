ID := ''

cid := $(shell docker ps -q)
image := $(shell grep -rh "image" manifest | cut -d ":" -f2- | sed -e 's/^[[:space:]]*//')

# todo: find out svc name
svc := $(shell for f in manifest/*; do cat $$f | yq '(.|select(.kind == "Service")).metadata.name' ; done)

kind_name := chart-testing

show_id:
	$(eval ID := $(shell cat ID))
	@if [ -z "${ID}" ] ; then echo "請在ID檔內填入學號" ; false ; fi
	@echo HW1 from $(ID)
	@echo
	@echo

prepare: show_id
	docker pull $(image)
	kind load docker-image $(image) --name $(kind_name)

run: prepare
	kubectl apply -f manifest
	# todo: wait for complete
	sleep 10

all: run
	$(eval nodeport := $(shell kubectl get svc $(svc) -o jsonpath='{.spec.ports[0].nodePort}'))
	docker exec $(cid) curl 127.0.0.1:$(nodeport)
	

clean:
	ls -al /


