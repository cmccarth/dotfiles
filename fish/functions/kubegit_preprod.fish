function kubegit_preprod --description "kubectl for GitHub Actions runners in TEST EKS cluster (arc-preprod) in AWS"
    if not contains -- --namespace $argv
        set -p argv --namespace=arc-preprod
    end
    kubectl --kubeconfig=$HOME/.kube/github_test_130 $argv
end
