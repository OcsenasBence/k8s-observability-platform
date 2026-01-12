# Kubernetes Observability Platform

The environement is managed via automated shell scripts located in the 'scripts/' directory.

## Usage

### 1. Start and tear down the Environment

```bash
./scripts/start.sh
```
This script will: Check if the cluster already exists.  
Create a new Kind Cluster named observability-platform using kind-config.yaml.  
Set the correct kubectl context.

Tear Down

To destroy the cluster and clean up resources, run:
```bash
.scripts/stop.sh
```

### 2. Deploy ArgoCD

 ```bash
./scripts/deploy-argocd.sh
```
This script will: Install AgroCD via Helm and configures the Application manifest to sync from this repository.

### 3. Access ArgoCD UI

Since the cluster runs locally, use port-forwarding to access the dashboard:
```bash
kubectl port-forward svc/argocd-server -n argocd 8080:443
```
URL:https://localhost:8080  
User: admin  
Password: The password is outputted by the deploy script. To retrieve it manually:  
```bash
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
```

## Project Structure

kind-config.yaml: Configuration for the Kind cluster.  
scripts/: Automation scripts for lifecycle management.  
platform/: Kubernetes manifests for platform components (e.g., ArgoCD).  