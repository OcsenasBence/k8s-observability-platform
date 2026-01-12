set -e

helm dependency update platform/argocd
helm upgrade --install argocd platform/argocd \
    --namespace argocd \
    --create-namespace \
    --wait

kubectl apply -f platform/argocd/argocd-app.yaml -n argocd

kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo