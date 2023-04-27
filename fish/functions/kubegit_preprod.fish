function kubegit_preprod --description "kubectl for GitHub Actions runners in PREPROD namespace of TEST EKS cluster in AWS"
    if not contains -- --namespace $argv
        set -p argv --namespace=arc-preprod
    end
    kubectl --kubeconfig=$HOME/.kube/github_test $argv
end
