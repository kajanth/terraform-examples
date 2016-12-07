.PHONY: all plan apply destroy

AWSKEYS = ../credentials.tfvars

all:
	@echo Options are: plan,apply,destroy.

plan:
	terraform plan -var-file=$(AWSKEYS)

apply:
	terraform apply -var-file=$(AWSKEYS)

destroy:
	terraform  destroy -var-file=$(AWSKEYS)
