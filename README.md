# Repo for k8s bootcamp project
- research for horizontal scaling

## Contributors
- Evan Drake
- Benjamin Serrato
- Steven Mendez
- Ryan Hoofard

## HPA check
- HPA: kubecatl get hpa [autoscaler name *optional] --watch[foreground watcher]
- Deployment: kubectl deploy [deployment name *optional] --watch [foreground watcher]

## Dios for finding errors
- findout what pods services daemonsets deployments and replicasets are doing
	- `kubectl -n kube-system get all`

## How to build
- create a kind cluster with config as config.yaml
	- `kind create cluster --config=k8s-files/config.yaml --name scaling`
- create rust container
	- `docker build . -t rust-demo`
- load docker container into the kind cluster
	- `kind load docker-image rust-demo --name scaling`
- apply yaml files to the cluster and watch benny's hard work
	1. `kubectl apply -f scale-namespace.yaml`
	2. `kubectl apply -f autoscale.yaml`
	3. `kubectl apply -f components.yaml`
	4. `kubectl apply -f deployment-rust.yaml`
	5. `kubectl apply -f deployment-rust.yaml`
- change default namespace with benny's amazing script
	- `bash .namespace.sh namespace scale-namespace`
- make sure you can curl and get an output
	- `curl localhost:8080`
- run create script in each metrics sub directory
	- alias for this in .bashrc
- portforward grafana
	- ```kubectl port-forward grafana-6648db4b8b-cr5xx 3000:3000 -n monitoring```
	- alias for this in .bashrc
- grapha needs to be initialzed with prometheus at start
	- import dashboard 1860
	- select prometheus from the drop down near the bottom


## Test
- test with hey tool
	- `hey -n 1000000 -z 5s http://127.0.0.1:8080`
