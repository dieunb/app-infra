# App infra

![Helm Operator](https://github.com/fluxcd/helm-operator/blob/master/docs/_files/fluxcd-helm-operator-diagram.png?raw=true)


## Documentation

Update current flux / helm-operator release

```
# flux
helm3 upgrade -f releases/flux/flux.yaml flux fluxcd/flux -n fluxcd

# helm-operator
helm3 upgrade -f releases/flux/helm_operator.yaml flux fluxcd/helm-operator -n fluxcd
```

## References
- [Gitops Helm Workshop](https://helm.workshop.flagger.dev/intro/#what-is-gitops)
