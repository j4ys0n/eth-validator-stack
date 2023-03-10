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

Dashboards and some of the prometheus config referenced from [CoinCashew's guide](https://www.coincashew.com/coins/overview-eth/guide-or-how-to-setup-a-validator-on-eth2-mainnet/part-i-installation/monitoring-your-validator-with-grafana-and-prometheus).

It's recommended to start geth first, because teku mounts the jwt secret that's created.

`docker-compose up -d geth && docker logs -f geth`

Once that's up and running, start the rest of the stack.

`docker-compose up -d`

To see logs for a container, run: `docker logs --tail <last-n-lines> -f <container-name>` like `docker logs --tail 100 -f teku`.

To see all of the logs for the stack, run `docker-compose logs --tail 10 -f`.

Use at your own risk. No support is provided. Feedback/improvements will be considered.