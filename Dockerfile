FROM openshift/golang-builder@sha256:4820580c3368f320581eb9e32cf97aeec179a86c5749753a14ed76410a293d83 AS builder
ENV __doozer=update BUILD_RELEASE=202202160023.p0.g3b330b7.assembly.stream BUILD_VERSION=v4.10.0 OS_GIT_MAJOR=4 OS_GIT_MINOR=10 OS_GIT_PATCH=0 OS_GIT_TREE_STATE=clean OS_GIT_VERSION=4.10.0-202202160023.p0.g3b330b7.assembly.stream SOURCE_GIT_TREE_STATE=clean 
ENV __doozer=merge OS_GIT_COMMIT=3b330b7 OS_GIT_VERSION=4.10.0-202202160023.p0.g3b330b7.assembly.stream-3b330b7 SOURCE_DATE_EPOCH=1637925163 SOURCE_GIT_COMMIT=3b330b72f43b178f1c16c5d504cf9ce248e679ad SOURCE_GIT_TAG=v0.2.0-157-g3b330b72 SOURCE_GIT_URL=https://github.com/uccps-samples/cluster-api-provider-libvirt 
RUN yum install -y libvirt-devel

WORKDIR /go/src/github.com/uccps-samples/cluster-api-provider-libvirt
COPY . .
RUN go build -o machine-controller-manager ./cmd/manager

FROM openshift/ose-base:v4.10.0.20220216.010142
ENV __doozer=update BUILD_RELEASE=202202160023.p0.g3b330b7.assembly.stream BUILD_VERSION=v4.10.0 OS_GIT_MAJOR=4 OS_GIT_MINOR=10 OS_GIT_PATCH=0 OS_GIT_TREE_STATE=clean OS_GIT_VERSION=4.10.0-202202160023.p0.g3b330b7.assembly.stream SOURCE_GIT_TREE_STATE=clean 
ENV __doozer=merge OS_GIT_COMMIT=3b330b7 OS_GIT_VERSION=4.10.0-202202160023.p0.g3b330b7.assembly.stream-3b330b7 SOURCE_DATE_EPOCH=1637925163 SOURCE_GIT_COMMIT=3b330b72f43b178f1c16c5d504cf9ce248e679ad SOURCE_GIT_TAG=v0.2.0-157-g3b330b72 SOURCE_GIT_URL=https://github.com/uccps-samples/cluster-api-provider-libvirt 
RUN INSTALL_PKGS=" \
      libvirt-libs openssh-clients genisoimage \
      " && \
    yum install -y $INSTALL_PKGS && \
    rpm -V $INSTALL_PKGS && \
    yum clean all
COPY --from=builder /go/src/github.com/uccps-samples/cluster-api-provider-libvirt/machine-controller-manager /

LABEL \
        name="openshift/ose-libvirt-machine-controllers" \
        com.redhat.component="ose-libvirt-machine-controllers-container" \
        io.openshift.maintainer.product="OpenShift Container Platform" \
        release="202202160023.p0.g3b330b7.assembly.stream" \
        io.openshift.build.commit.id="3b330b72f43b178f1c16c5d504cf9ce248e679ad" \
        io.openshift.build.source-location="https://github.com/uccps-samples/cluster-api-provider-libvirt" \
        io.openshift.build.commit.url="https://github.com/uccps-samples/cluster-api-provider-libvirt/commit/3b330b72f43b178f1c16c5d504cf9ce248e679ad" \
        version="v4.10.0"

