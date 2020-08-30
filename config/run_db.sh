#!/bin/bash 

exec nohup /config/run_idx.sh & 

sleep 3

exec /usr/bin/mongod --dbpath /mongodb/db
