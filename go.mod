module github.com/example/memcached-operator

go 1.13

require (
	github.com/go-logr/logr v0.2.1-0.20200730175230-ee2de8da5be6
	github.com/onsi/ginkgo v1.14.0
	github.com/onsi/gomega v1.10.1
	k8s.io/api v0.19.0
	k8s.io/apimachinery v0.19.0
	k8s.io/client-go v0.19.0
	k8s.io/klog v1.0.0
	sigs.k8s.io/controller-runtime v0.6.2
)

replace sigs.k8s.io/controller-runtime v0.6.2 => /Users/vnarsing/go/src/github.com/kubernetes-sigs/controller-runtime
