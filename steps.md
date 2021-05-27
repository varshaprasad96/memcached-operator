## Steps to setup prometheus and collect metrics

1. Follow the `Operator SDK` quickstart or tutorial to create a project.
2. Uncomment the `#PROMETHEUS` section in `config/default/kustomization.yaml`.
3. Generate the manifests, create an operator image and deploy on cluster.

## Install kube-prometheus on cluster

1. Fork the repository `https://github.com/prometheus-operator/kube-prometheus`.

```
git clone https://github.com/prometheus-operator/kube-prometheus
```

2. Create the CRDs for the monitoring stack that comes along with kube-prometheus.

```
kubectl create -f manifests/setup
```

3. Create the prometheus instance and other related components.

```
kubectl create -f manifests/
```

## Make the prometheus instance listen to metrics from service monitor

1. Modify the `prometheus` object in `manifests/prometheus-prometheus.yaml`, to target the service monitor created by the memcached operator

Modify the following sections: `serviceMonitorNamespaceSelector` and `serviceMonitorSelector`

```yaml
  serviceMonitorNamespaceSelector:
    matchLabels:
      control-plane: controller-manager
  serviceMonitorSelector:
    matchLabels:
      control-plane: controller-manager
```
These are labels which you can get from:

```
k get namespaces memcached-operator-system -o yaml
k get servicemonitor -n memcached-operator-system -o yaml
```

Apply the prometheus yaml:

```
k apply -f manifests/prometheus-prometheus.yaml
```

2. Port forward the prometheus service to check the metrics locally

```
k --namespace monitoring port-forward svc/prometheus-k8s 9090
```

The prometheus UI will now be available in `localhost:9090`.
