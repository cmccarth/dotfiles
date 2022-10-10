function kubegit_test --description "kubectl for GitHub Actions runners TEST EKS cluster in AWS"
    if not contains -- --namespace $argv
        set -p argv --namespace=actions-runner-controller
    end
    kubectl --kubeconfig=$HOME/.kube/github_test $argv
end
