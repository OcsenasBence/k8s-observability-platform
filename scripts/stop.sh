CLUSTER_NAME="observability-platform"

echo "$CLUSTER_NAME leállítása és törlése..."
kind delete cluster --name "$CLUSTER_NAME"
echo "Környezet sikeresen törölve."