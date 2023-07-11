#!/bin/sh

# ColorEchoForShell
echoCyan() {
  printf "\\033[36m%s\\033[m\n" "$*"
}

echoGreen() {
  printf "\\033[32m%s\\033[m\n" "$*"
}

error() {
  printf "\\033[31m%s\\033[m\n" "$*" >&2
  exit 1
}

set -eu

SRC_URL="https://data.moi.gov.tw/MoiOD/System/DownloadFile.aspx?DATA=3BB8E3CE-8223-43AF-B1AB-5824FA889883"

commands="wget cut tail grep sort uniq mktemp realpath dirname"
for cmd in $commands; do
    if ! command -v "$cmd" > /dev/null 2>&1; then
        error "$cmd could not be found. Please install it first."
    fi
done

SCRIPT_DIR=$(dirname "$(realpath "$0")")

TEMP_FILE=$(mktemp "${TMPDIR:-/tmp}/fraud_domain_process.XXXXXX")
RESULT_FILE="$SCRIPT_DIR/fraud_domains.txt"

trap 'rm -f "$TEMP_FILE"' EXIT

echoCyan "Downloading file from $SRC_URL ..."
echo

if ! wget "$SRC_URL" -O "$TEMP_FILE"; then
    error "Error in downloading file from $SRC_URL"
fi

echoGreen "File downloaded successfully to $TEMP_FILE"
echo

echoCyan "Start processing the downloaded data ..."
echo

if ! cut -d',' -f2 "$TEMP_FILE" | tail -n '+3' | grep -vE '[/:?=&#%+!;]' | sort | uniq > "$RESULT_FILE"; then
    error "Error in processing data from $SRC_URL"
fi

echoGreen "Data processed successfully"
echo

if [ ! -s "$RESULT_FILE" ]; then
    error "No data found or file is empty: $RESULT_FILE"
fi

echoGreen "Found $(wc -l < "$RESULT_FILE") lines in the result file $RESULT_FILE"
