#!/bin/bash

# start database
service redis-server start

# start ntopng
cd /ntop/ntopng && ./ntopng
