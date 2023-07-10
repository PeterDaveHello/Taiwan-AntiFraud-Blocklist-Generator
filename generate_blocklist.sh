#!/usr/bin/env bash

SRC_URL="https://data.moi.gov.tw/MoiOD/System/DownloadFile.aspx?DATA=3BB8E3CE-8223-43AF-B1AB-5824FA889883"
RESULT_FILE="fraud_domains.txt"

echo "Try to download and process $SRC_URL ..."

cut -d',' -f2 <(wget -qO- "$SRC_URL") | tail -n '+3' | grep -vE '[/:?=&#%+!;]' | sort | uniq > "$RESULT_FILE"

echo "Found $(wc -l < "$RESULT_FILE") lines in the result file $RESULT_FILE"
