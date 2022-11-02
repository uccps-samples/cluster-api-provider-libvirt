module github.com/uccps-samples/cluster-api-provider-libvirt

go 1.16

require (
	github.com/davecgh/go-spew v1.1.1
	github.com/docker/spdystream v0.0.0-20181023171402-6480d4af844c // indirect
	github.com/elazarl/goproxy v0.0.0-20200426045556-49ad98f6dac1 // indirect
	github.com/ghodss/yaml v1.0.0
	github.com/golang/glog v0.0.0-20160126235308-23def4e6c14b
	github.com/golang/mock v1.3.1
	github.com/libvirt/libvirt-go v5.10.0+incompatible
	github.com/libvirt/libvirt-go-xml v5.10.0+incompatible
	github.com/uccps-samples/machine-api-operator v0.2.1-0.20221102045806-5990628ebb98
	golang.org/x/oauth2 v0.0.0-20200107190931-bf48bf16ab8d // indirect
	golang.org/x/time v0.0.0-20200416051211-89c76fbcd5d1 // indirect
	google.golang.org/appengine v1.6.6 // indirect
	k8s.io/api v0.19.4
	k8s.io/apiextensions-apiserver v0.19.4 // indirect
	k8s.io/apimachinery v0.19.4
	k8s.io/client-go v0.19.4
	k8s.io/code-generator v0.19.4
	k8s.io/gengo v0.0.0-20200518160137-fb547a11e5e0 // indirect
	k8s.io/klog v1.0.0
	sigs.k8s.io/controller-runtime v0.6.2
)

replace (
	sigs.k8s.io/cluster-api-provider-aws => github.com/openshift/cluster-api-provider-aws v0.2.1-0.20200929152424-eab2e087f366
	sigs.k8s.io/cluster-api-provider-azure => github.com/openshift/cluster-api-provider-azure v0.1.0-alpha.3.0.20200929220456-04e680e51d03
)

replace (
	github.com/prometheus/procfs => github.com/orangeji11/procfs v0.6.1-0.20211213194839-2b365b0a8ef0
	golang.org/x/sys => github.com/loongson/sys v0.0.0-20211022032851-442ec7e848c8
)
