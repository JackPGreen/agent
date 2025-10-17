#!/bin/bash
set -euo pipefail

# This does not work with a symlink to this script
# SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
# See https://stackoverflow.com/a/246128/24637657
SOURCE=${BASH_SOURCE[0]}
while [ -L "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  SCRIPT_DIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )
  SOURCE=$(readlink "$SOURCE")
  # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
  [[ $SOURCE != /* ]] && SOURCE=$SCRIPT_DIR/$SOURCE
done
SCRIPT_DIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )

export FLUENTDO_AGENT_IMAGE=${FLUENTDO_AGENT_IMAGE:?}
export FLUENTDO_AGENT_TAG=${FLUENTDO_AGENT_TAG:?}
export CONTAINER_RUNTIME=${CONTAINER_RUNTIME:-docker}

"$SCRIPT_DIR"/run-bats.sh --filter-tags integration,containers --recursive "$SCRIPT_DIR/tests"
echo "INFO: All tests complete"
