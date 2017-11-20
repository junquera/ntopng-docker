#!/bin/bash
service redis-server start
cd /ntop/ntopng && ./ntopng # TODO Ver cómo pasar interfaces -i tcp://127.0.0.1:5556
