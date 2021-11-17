# kubectl completion
# TODO: find out how to use is_installed instead of command -v
if command -v kubectl &> /dev/null; then
    source <(kubectl completion zsh)
    alias kcl=kubectl
    complete -F __start_kubectl kcl
    compdef kcl=kubectl
    # for multiple kubeconfig files to be used
    export KUBECONFIG=$(find ~/.kube -type f -name "kube_config*" | sed -z "s/\n/:/g")
fi

# helm aliases
if command -v helm &> /dev/null; then
    source <(helm completion zsh)
fi