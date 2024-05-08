# Deploy the vaultwarden helm chart
export NAMESPACE=learnroom
export RELEASE_NAME=learnroom
export VALUES_FILE=charts/learnroom/test-values.yaml
export CHART_FOLDER=charts/learnroom
export PORT=8080
export SERVICE_NAME=learnroom-learn-room-frontend

# Create the namespace if it does not exist
if ! kubectl get namespace $NAMESPACE &> /dev/null; then
    kubectl create namespace $NAMESPACE
fi

if [ -f "$VALUES_FILE" ]; then
    helm upgrade -i \
    -n $NAMESPACE $RELEASE_NAME $CHART_FOLDER \
    -f "$VALUES_FILE"
else
    helm upgrade -i \
    -n $NAMESPACE $RELEASE_NAME $CHART_FOLDER
fi

# Wait for the deployment to be ready
sleep 5

echo "Your LearnRoom frontend is available at: http://localhost:$PORT"

kubectl port-forward -n $NAMESPACE svc/$SERVICE_NAME "$PORT":80
