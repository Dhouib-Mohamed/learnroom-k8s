# Deploy the prometheus helm chart
export NAMESPACE=argocd
export PORT=4000

# Create the namespace if it does not exist
if ! kubectl get namespace $NAMESPACE &> /dev/null; then
    kubectl create namespace $NAMESPACE
fi

kubectl apply -n $NAMESPACE -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl patch svc argocd-server -n $NAMESPACE -p '{"spec": {"type": "LoadBalancer"}}'

kubectl -n $NAMESPACE port-forward svc/argocd-server $PORT:443