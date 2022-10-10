function kubegit_prod --description "kubectl for GitHub Actions runners PROD EKS cluster in AWS"
    if not contains -- --namespace $argv
        set -p argv --namespace=actions-runner-controller
    end
    kubectl --kubeconfig=$HOME/.kube/github_prod $argv
end
