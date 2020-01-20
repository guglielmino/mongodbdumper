#!/bin/bash

set -e

echo "Job started: $(date)"

DATE=$(date +%Y%m%d_%H%M%S)
FILE="/backup/backup-$DATE.tar.gz"

mkdir -p dump
mongodump --host $MONGO_HOST --ssl --username $USER --password $PASSWORD --authenticationDatabase admin --db $DATABASE --quiet
tar -zcvf $FILE dump/
rm -rf dump/

echo "Job finished: $(date)"