# Eth Validator Stack

__*INITIAL VERSION*__

Full stack docker-compose for an Ethereum 2.0 Validator using the go-ethereum (geth) execution layer and Teku consensus layer using docker-compose.

It also runs prometheus to gather metrics, prometheus node exporter for host machine metrics, and an auto-provisioned grafana with a couple default dashboards.

There are a couple things you might want to edit to fit your environment. This specific config puts geth's data in `/mnt/data/geth` and teku's data in `/mnt/data/teku`. If you're using external volumes, you'll want to mount them there respectively.

In the `prometheus.yml` configuration, under job config, you'll have to enter your host's private ip address where it says `host-ip-here` (not your public ip) due to how the node exporter container has to run to get host metrics.

```yaml
  - job_name: 'node_exporter'
    static_configs:
      - targets: ['host-ip-here:9100']
```

Use at your own risk. No support is provided. Feedback/improvements will be considered.