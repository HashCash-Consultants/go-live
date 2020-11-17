#!/usr/bin/env bash

set -e

source /etc/profile

echo "using config:"
cat hcnet-core.cfg

# initialize new db
hcnet-core new-db

if [ "$1" = "standalone" ]; then
  # start a network from scratch
  hcnet-core force-scp

  # initialze history archive for stand alone network
  hcnet-core new-hist vs

  # serve history archives to aurora on port 1570
  pushd /history/vs/
  python3 -m http.server 1570 &
  popd
fi

exec /init -- hcnet-core run