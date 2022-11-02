#!/bin/sh
CONTAINER_RUNTIME=${CONTAINER_RUNTIME:-podman}

if [ "$IS_CONTAINER" != "" ]; then
  for TARGET in "${@}"; do
    find "${TARGET}" -name '*.go' ! -path '*/vendor/*' ! -path '*/.build/*' -exec gofmt -s -w {} \+
  done
  git diff --exit-code
else
  "$CONTAINER_RUNTIME" run -it --rm \
    --env IS_CONTAINER=TRUE \
    --volume "${PWD}:/go/src/github.com/uccps-samples/cluster-api-provider-libvirt:z" \
    --workdir /go/src/github.com/uccps-samples/cluster-api-provider-libvirt \
    registry.ci.openshift.org/openshift/release:golang-1.16 \
    ./hack/go-fmt.sh "${@}"
fi
