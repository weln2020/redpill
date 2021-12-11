#!/bin/bash

sudo apt-get update && sudo apt-get install --yes --no-install-recommends ca-certificates build-essential git libssl-dev curl cpio bspatch vim gettext bc bison flex dosfstools kmod jq

root=`pwd`
mkdir output

git clone https://github.com/tossp/redpill-tool-chain.git
cd redpill-tool-chain

sudo ./redpill_tool_chain.sh add https://raw.githubusercontent.com/pocopico/rp-ext/master/ixgbe/rpext-index.json
sudo ./redpill_tool_chain.sh add https://raw.githubusercontent.com/pocopico/rp-ext/master/mpt3sas/rpext-index.json
sudo ./redpill_tool_chain.sh add https://raw.githubusercontent.com/pocopico/rp-ext/master/igb/rpext-index.json

cp ${root}/config.json ./apollolake_user_config.json
sudo ./redpill_tool_chain.sh build apollolake-7.0.1-42218
sudo ./redpill_tool_chain.sh auto apollolake-7.0.1-42218
mv images/*.img ${root}/output/
