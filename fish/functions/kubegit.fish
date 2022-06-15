function kubegit --description "kubectl for GitHub Actions runners EKS cluster in AWS"
    kubectl --kubeconfig=$HOME/.kube/github $argv
end
