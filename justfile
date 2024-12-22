up *args="./config/kind_config.yaml":
  kind create cluster --config={{ args }}
down:
  kind delete cluster

nodeip:
	@kubectl get node -o=jsonpath='{.items[*].metadata.name}, {.items[*].status.addresses[].address}'
podip:
	@kubectl get pod -o=jsonpath='{.items[*].metadata.name}, {.items[*].spec.nodeName}, {.items[*].status.podIP}'
