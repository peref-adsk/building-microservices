install-nginx:
	@kubectl config use-context docker-desktop
	@kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.9.5/deploy/static/provider/cloud/deploy.yaml
start-microservices:
	@kubectl apply -f kubernetes-manifests/services
	@kubectl delete -A ValidatingWebhookConfiguration ingress-nginx-admission
	@kubectl apply -f kubernetes-manifests/networking
install-helm:
	@brew install helm
install-elasticsearch: 
	@helm repo add elastic https://helm.elastic.co
	@helm repo update
	@helm install elasticsearch elastic/elasticsearch -f kubernetes-manifests/logging/elastic-search.yaml
install-kibana:
	@helm install kibana elastic/kibana -f kubernetes-manifests/logging/kibana.yaml
start-kibana:
	@kubectl port-forward deployment/kibana-kibana 5601 
install-logstash:
	@helm install logstash elastic/logstash -f kubernetes-manifests/logging/logstash.yaml
install-filebeat:
	@helm install filebeat elastic/filebeat -f kubernetes-manifests/logging/filebeat.yaml