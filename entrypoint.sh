#!/bin/sh -l

echo "mode: $1"
sh -c "python /utils.py --mode=$1"

