# App infra

![Helm Operator](https://github.com/fluxcd/helm-operator/blob/master/docs/_files/fluxcd-helm-operator-diagram.png?raw=true)


## Documentation

Update current flux / helm-operator release

```
# Create flux-git-deploy from your private ssh key
kubectl create secret generic flux-git-deploy --from-file=identity=your_private_ssh_key_path

# flux
helm3 upgrade -i -f fluxcd/flux.yaml flux fluxcd/flux -n fluxcd --version=1.2.0

# helm-operator
helm3 upgrade -i -f fluxcd/helm_operator.yaml helm-operator fluxcd/helm-operator -n fluxcd
```

Edit `/etc/hosts` file to map domain to your service. For example:

```
127.0.0.1 server.prometheus.internal.local
127.0.0.1 alertmanager.prometheus.internal.local
127.0.0.1 kube-state-metrics.prometheus.internal.local
127.0.0.1 pushgateway.prometheus.internal.local
127.0.0.1 node-exporter.prometheus.internal.local
127.0.0.1 grafana.internal.local
```

## References
- [Gitops Helm Workshop](https://helm.workshop.flagger.dev/intro/#what-is-gitops)

