function kubegit --description "kubectl for GitHub Actions runners EKS cluster in AWS"
    if not contains -- --namespace $argv
        set -p argv --namespace=actions-runner-controller
    end
    kubectl --kubeconfig=$HOME/.kube/github $argv
end
