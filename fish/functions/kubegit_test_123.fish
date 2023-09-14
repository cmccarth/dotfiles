function kubegit_test_123 --description "kubectl for GitHub Actions runners TEST EKS cluster v1.23 in AWS"
    if not contains -- --namespace $argv
        set -p argv --namespace=default
    end
    kubectl --kubeconfig=$HOME/.kube/github_test_123 $argv
end
