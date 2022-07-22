
## step 1
alias clusup="kind create cluster --config=k8s-files/config.yaml --name scaling"
## step 2
alias loadcon="docker build . -t rust-demo && \
  kind load docker-image rust-demo --name scaling"
## step 3
alias loadyml="kubectl apply -f scale-namespace.yaml && \
  kubectl apply -f autoscale.yaml && \
  kubectl apply -f components.yaml && \
  kubectl apply -f deployment-rust.yaml && \
  kubectl apply -f deployment-rust.yaml"

## monitoring
alias graf="bash metrics/kubernetes-grafana/create.sh && \
  bash metrics/kubernetes-node-exporter/create.sh && \
  bash metrics/kubernetes-prometheus/create.sh"
alias metrics="kubectl port-forward grafana-6648db4b8b-cr5xx 3000:3000 -n monitoring"

## testing
alias heytest="hey -n 1000000 -z 1m http://127.0.0.1:8080"

## help
alias lochelp="cat .bashrc | grep ^alias"
