# Deploy the prometheus helm chart
export NAMESPACE=monitoring
export RELEASE_NAME=prometheus
export VALUES_FILE=charts/monitoring/values.yaml
export PORT=9090

# Create the namespace if it does not exist
if ! kubectl get namespace $NAMESPACE &> /dev/null; then
    kubectl create namespace $NAMESPACE
fi

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update


if [ -f "$VALUES_FILE" ]; then
    helm upgrade -i \
    -n $NAMESPACE $RELEASE_NAME prometheus-community/prometheus \
    -f "$VALUES_FILE"
else
    helm upgrade -i \
    -n $NAMESPACE $RELEASE_NAME prometheus-community/prometheus
fi

kubectl -n $NAMESPACE port-forward svc/prometheus-prometheus-node-exporter $PORT:9100