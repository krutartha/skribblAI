#!/bin/bash

echo "beginning download"
gsutil -m cp 'gs://quickdraw_dataset/full/simplified/*.ndjson' ../dataset/
echo "done downloading"
