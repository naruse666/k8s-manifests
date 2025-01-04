# see recipe `just -l`

up *args="./config/kind_config.yaml":
  kind create cluster --config={{ args }}
down:
  kind delete cluster

# helmfile apply
# need helm diff plugin
apply:
  @helmfile apply


# show node name and ip
nodeip:
	@kubectl get node -o=jsonpath='{.items[*].metadata.name}, {.items[*].status.addresses[].address}'

# show pod name, which node, pod ip
podip:
	@kubectl get pod -o=jsonpath='{.items[*].metadata.name}, {.items[*].spec.nodeName}, {.items[*].status.podIP}'

es:
  @kubectl port-forward -n efk svc/elasticsearch 9200:9200

kibana:
  @kubectl port-forward -n efk svc/kibana 8080:5601
