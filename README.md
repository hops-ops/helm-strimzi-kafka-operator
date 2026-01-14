# helm-strimzi-kafka-operator

Crossplane configuration that installs the Strimzi Kafka operator Helm chart with a minimal, stable interface.

## Overview

This configuration provides a Crossplane XRD for deploying the Strimzi Kafka operator using the Helm provider. Strimzi provides a way to run Apache Kafka on Kubernetes in various deployment configurations.

## Usage

### Minimal Example

```yaml
apiVersion: helm.hops.ops.com.ai/v1alpha1
kind: StrimziKafkaOperator
metadata:
  name: strimzi-kafka-operator
  namespace: my-namespace
spec:
  clusterName: my-cluster
```

### Standard Example

```yaml
apiVersion: helm.hops.ops.com.ai/v1alpha1
kind: StrimziKafkaOperator
metadata:
  name: strimzi-kafka-operator
  namespace: my-namespace
spec:
  clusterName: my-cluster
  namespace: strimzi
  labels:
    team: platform
    environment: production
  providerConfigRef:
    name: my-cluster
    kind: ProviderConfig
  values:
    watchAnyNamespace: true
    replicas: 1
```

## Configuration Options

| Field | Description | Default |
|-------|-------------|---------|
| `clusterName` | Target cluster name (used for provider config) | Required |
| `namespace` | Kubernetes namespace for the release | `strimzi` |
| `name` | Helm release name | XR metadata.name |
| `labels` | Labels applied to managed resources | See below |
| `providerConfigRef.name` | Helm ProviderConfig name | `clusterName` |
| `providerConfigRef.kind` | ProviderConfig kind | `ProviderConfig` |
| `values` | Helm values (merged with defaults) | `{}` |
| `overrideAllValues` | Helm values (replaces all defaults) | `{}` |
| `managementPolicies` | Crossplane management policies | `["*"]` |

### Default Labels

```yaml
hops.ops.com.ai/managed: "true"
hops.ops.com.ai/strimzikafkaoperator: "<name>"
```

## Helm Chart

- **Chart**: strimzi-kafka-operator
- **Repository**: https://strimzi.io/charts/
- **Version**: 0.49.1

## Dependencies

- Provider: crossplane-contrib/provider-helm >= v1.0.6
- Function: crossplane-contrib/function-auto-ready >= v0.6.0
