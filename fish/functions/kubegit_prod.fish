function kubegit_prod --description "kubectl for GitHub Actions runners PROD EKS cluster in AWS"
    if not contains -- --namespace $argv
        set -p argv --namespace=arc-prod
    end
    kubectl --kubeconfig=$HOME/.kube/github_prod $argv
end
