# DNS Proxy For IRAN sanctioned domain
This repo include a docker image that use [dnsproxy](https://github.com/vietor/dnsproxy) and evey time that container starts pulls the list of domains from [this repository](https://github.com/sajad-sadra/iran-domains-sanction) and proxy them to the addresses that you give in environment variables.

## How to use
Just simply use [this docker image](https://hub.docker.com/r/sajadsadra/dns-proxy-iran-sanction) and publish port `53` as `udp` and use environment variables in the table below:

| Name | Description |
|--|--|
| `SANCTION_IP` | Address of proxy server for sanctioned domain |
| `FILTER_IP` | Address of proxy server for filtered domain |
| `OTHER_HOSTS_URL` | *optional* - URL that includes extra hostnames with their IPs |

### Simple Command
```
docker run -e SANCTION_IP="1.1.1.1" -e FILTER_IP="2.2.2.2" -p 53:53/udp sajadsadra/dns-proxy-iran-sanction
```
