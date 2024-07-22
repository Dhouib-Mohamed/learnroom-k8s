# learnroom-k8s

## Description
Ths repository is used to manage the deployment of the learnroom application in a kubernetes cluster ( azure AKS ).

## Prerequisites
- Azure CLI
- Azure AKS
- kubectl
- Helm
- Docker

## Installation
1. Clone the repository
2. Deploy Argocd
    ```bash
        bash scripts/deploy-argocd.sh
    ```
3. Deploy the application
    ```bash
        bash scripts/deploy-learnroom.sh
    ```
4. Deploy Prometheus for monitoring
    ```bash
        bash scripts/deploy-prometheus.sh
    ```

## Used tools
- [ArgoCD](https://argoproj.github.io/argo-cd/)
- [Prometheus](https://prometheus.io/)
- [Kubernetes](https://kubernetes.io/)
- [Helm](https://helm.sh/)
- [Docker](https://www.docker.com/)
- [Azure AKS](https://azure.microsoft.com/en-us/services/kubernetes-service/)
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
- [kubectl](https://kubernetes.io/docs/reference/kubectl/overview/)