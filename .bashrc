
alias graf="bash metrics/kubernetes-grafana/create.sh && \
  bash metrics/kubernetes-node-exporter/create.sh && \
  bash metrics/kubernetes-prometheus/create.sh"
alias metrics="kubectl port-forward grafana-6648db4b8b-cr5xx 3000:3000 -n monitoring"
