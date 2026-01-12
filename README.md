# Kubernetes Observability Platform

The environement is managed via automated shell scripts located in the 'scripts/' directory.

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

Project Structure

kind-config.yaml: Configuration for the Kind cluster.
scripts/: Automation scripts for lifecycle management.