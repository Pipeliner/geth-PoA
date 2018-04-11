#!/bin/sh

GETH=/home/vadim/.config/Mist/binaries/Geth/unpacked/geth
PORT=30303

FILEPATH=`dirname $0`
cd $FILEPATH
export CLIQUE=`pwd`


echo 'Initializing new Clique PoA Chain'
$GETH --datadir $CLIQUE/datadir --port $PORT init ./clique_genesis.json

$GETH --datadir $CLIQUE/datadir --port $PORT --rpc  --rpcapi "eth,net,web3,debug" --targetgaslimit '9000000000000' --rpccorsdomain="*" --preload "${CLIQUE}/setup.js" console
