up:
	kind create cluster --config=./config/kind_config.yaml
down:
	kind delete cluster


nodeip:
	@kubectl get node -o=jsonpath='{.items[*].metadata.name}, {.items[*].status.addresses[].address}'
podip:
	@kubectl get pod -o=jsonpath='{.items[*].spec.nodeName}, {.items[*].status.podIP}'
