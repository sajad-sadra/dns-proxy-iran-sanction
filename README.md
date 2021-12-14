# DNS Proxy For IRAN sanctioned domain
This repo include a docker image that use [updns](https://github.com/wyhaya/updns) and evey time that container starts pulls the list of domains from [this repository](https://github.com/sajad-sadra/iran-domains-sanction) and proxy them to the addresses that you give in environment variables.

## How to use
