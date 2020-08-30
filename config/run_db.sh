#!/bin/bash 

exec nohup /config/run_idx.sh & 

sleep 3

exec /usr/bin/mongod --bind_ip=0.0.0.0 --dbpath /mongodb/db
