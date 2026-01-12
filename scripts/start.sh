set -e

CLUSTER_NAME="observability-platform"

echo "Local Kubernetes Platform indítása ($CLUSTER_NAME)..."

if kind get clusters | grep -q "^$CLUSTER_NAME$"; then
    echo "A '$CLUSTER_NAME' cluster már létezik."
else
    kind create cluster --name "$CLUSTER_NAME" --config kind-config.yaml
    echo "Cluster sikeresen létrehozva!"
fi

echo "Cluster info:"
kubectl cluster-info --context "kind-$CLUSTER_NAME"