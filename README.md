# p4-payment-proxy

Payment Proxy process for HyperBEAM Operators, this proxy process hooks into the HyperBEAM Node p4 payment system, to create a bridge for AO tokens and the p4 payment workflow. This process allows customers to top up their tokens by simply transferring them to this process address. The Node sync's with this process to verify payment for compute.

## Spawn Proxy

In order to spawn a proxy, you need to provide the following tags to properly connect the process to a node and operator, this must occur during the spawning process.

Using AOS Console

```
export NODE_ADDRESS=$(curl "https://YOUR_NODE/~meta@1.0/info/address")
export OPERATOR=YOUR_WALLET
aos _hb_proxy \
--tag-name Authority --tag-value $(NODE_ADDRESS) \
--tag-name Operator --tag-value $(OPERATOR) \
--tag-name Node --tag-value $(NODE_ADDRESS) \
--tag-name On-Boot --tag-value $(PROXY_SRC)
```

## Configure Node Opts with Payment Process

TODO:

## Tests

dependencies: lua

```
lua test/run_test.lua
```


