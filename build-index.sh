#! /bin/bash

set -e -o pipefail

REPO_URL="https://backube.github.io/helm-charts"

SCRIPT_NAME="$(basename "$0")"
SCRIPT_DIR="$(dirname "$(realpath "$0")")"
CHART_DIR="${SCRIPT_DIR}/docs"

function usage {
    cat - <<USAGE
Usage:
  $1 <new_chart.tgz>

  This will add new_chart.tgz to the index.yaml file and move it into position
  in the docs directory (if necessary). After running this script, commit both
  the modified index.yaml and the chart archive (in its new locaton).
USAGE
}

if [[ $# -ne 1 ]]; then
    usage "$SCRIPT_NAME"
    exit 1
fi
NEW_CHART="$1"

MERGE_DIR="$(mktemp -d)"
cp "$NEW_CHART" "$MERGE_DIR"
[[ ! -f "${NEW_CHART}.prov" ]] || cp "${NEW_CHART}.prov" "$MERGE_DIR"
helm repo index --url "$REPO_URL" --merge "${CHART_DIR}/index.yaml" "${MERGE_DIR}"
cp "${MERGE_DIR}/$(basename "${NEW_CHART}")" "${CHART_DIR}"
[[ ! -f "${MERGE_DIR}/$(basename "${NEW_CHART}").prov" ]] || cp "${MERGE_DIR}/$(basename "${NEW_CHART}").prov" "${CHART_DIR}"
cp "${MERGE_DIR}/index.yaml" "${CHART_DIR}"

rm -rf "${MERGE_DIR}"
