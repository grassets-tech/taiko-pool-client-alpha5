#!/bin/sh

set -eou pipefail

mkdir -p /data

if [ ! -f "/data/kzg_bn254_22.srs" ];then
    wget https://storage.googleapis.com/zkevm-circuits-keys/kzg_bn254_22.srs -P /data
fi

/prover_rpcd \
    --bind 0.0.0.0:9000 \
    --lookup zkevm_chain_prover_rpcd_client:9000
