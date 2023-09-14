function kubegit_pilot --description "kubectl for GitHub Actions runners TEST EKS cluster (arc-pilot) in AWS"
    if not contains -- --namespace $argv
        set -p argv --namespace=arc-pilot
    end
    kubectl --kubeconfig=$HOME/.kube/github_test $argv
end
