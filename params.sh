#!/bin/bash

export CLUSTER_NAME="${CLUSTER_NAME:=k8s-cancentral-01-default-aks}"
export OIDC_PROVIDER="${OIDC_PROVIDER:-default}"
export OIDC_REDIRECT_URI="${OIDC_REDIRECT_URI:-default}"
export OIDC_AUTH_URL="${OIDC_AUTH_URL:-default}"
export CLIENT_ID="${CLIENT_ID:-default}"
export APPLICATION_SECRET="${APPLICATION_SECRET:-default}"
export CONFIG_FILE="${CONFIG_FILE:-kfctl_k8s_istio.v1.0.1.yaml}"

yq w -i ${CONFIG_FILE} 'metadata.clusterName' ${CLUSTER_NAME}
yq w -i ${CONFIG_FILE} 'spec.applications[1].kustomizeConfig.parameters[2].value' ${OIDC_PROVIDER}
yq w -i ${CONFIG_FILE} 'spec.applications[1].kustomizeConfig.parameters[3].value' ${OIDC_REDIRECT_URI}
yq w -i ${CONFIG_FILE} 'spec.applications[1].kustomizeConfig.parameters[4].value' ${OIDC_AUTH_URL}
yq w -i ${CONFIG_FILE} 'spec.applications[1].kustomizeConfig.parameters[5].value' ${CLIENT_ID}
yq w -i ${CONFIG_FILE} 'spec.applications[1].kustomizeConfig.parameters[6].value' ${APPLICATION_SECRET}
