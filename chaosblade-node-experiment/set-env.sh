#!/bin/bash

# install helm 3
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

# download chaosblade pkg
wget -qO chaosblade-operator-0.6.0.tgz https://github.com/chaosblade-io/chaosblade/releases/download/v0.6.0/chaosblade-operator-0.6.0-v3.tgz

# create namespace
kubectl create namespace chaosblade

# install chaosblade
helm install chaos chaosblade-operator-0.6.0.tgz --set webhook.enable=true --namespace=chaosblade

# add repo
helm repo add apphub-incubator https://apphub.aliyuncs.com/incubator/

# inatall guestbook
helm install guestbook apphub-incubator/guestbook --set service.type=NodePort --namespace=chaosblade
