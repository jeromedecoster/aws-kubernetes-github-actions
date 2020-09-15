.SILENT:

help:
	{ grep --extended-regexp '^[a-zA-Z_-]+:.*#[[:space:]].*$$' $(MAKEFILE_LIST) || true; } \
	| awk 'BEGIN { FS = ":.*#[[:space:]]*" } { printf "\033[1;32m%-22s\033[0m%s\n", $$1, $$2 }'

setup: # install eksctl + kubectl + yq, create aws user + ecr repository
	./make.sh setup

dev: # local development (by calling npm script directly)
	./make.sh dev

test: # run tests (by calling npm script directly)
	./make.sh test
	
build: # build the production image
	./make.sh build
	
run: # run the built production image on localhost
	./make.sh run

rm: # remove the running container
	./make.sh rm

cluster-create: # create the EKS cluster
	./make.sh cluster-create

cluster-create-config: # create kubectl EKS configuration
	./make.sh cluster-create-config

cluster-apply-config: # apply kubectl EKS configuration
	./make.sh cluster-apply-config

cluster-elb: # get the cluster ELB URL
	./make.sh cluster-elb

cluster-delete: # delete the EKS cluster
	./make.sh cluster-delete