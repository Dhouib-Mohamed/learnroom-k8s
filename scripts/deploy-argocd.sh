# Deploy the prometheus helm chart
export NAMESPACE=argocd
export PORT=4000

# Create the namespace if it does not exist
if ! kubectl get namespace $NAMESPACE &> /dev/null; then
    kubectl create namespace $NAMESPACE
fi

kubectl apply -n $NAMESPACE -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl patch svc argocd-server -n $NAMESPACE -p '{"spec": {"type": "LoadBalancer"}}'

kubectl apply -f charts/argocd/application.yaml

sleep 10

# Read from kubernetes the secret argocd-initial-admin-secret the field password and show it
password=$(kubectl -n $NAMESPACE get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)

echo " Your ArgoCD username is: admin"
echo " Your ArgoCD password is: $password"
echo " Please change your password after login for security reasons."

echo "Your ArgoCD is available at: https://localhost:$PORT"

kubectl -n $NAMESPACE port-forward svc/argocd-server $PORT:443