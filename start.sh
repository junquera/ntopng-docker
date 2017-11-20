#!/bin/bash

service redis-server start

cd /ntop/ntopng && ./ntopng
