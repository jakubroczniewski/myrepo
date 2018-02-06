#!/bin/bash

for x in {1..6}; do
  if [ "${x}" -eq "6" ]; then
    x=99
  fi
  echo repairing orkan${x}
  ssh jroot@orkan${x} '/root/bin/make_sync_sql.sh | tee /home/jroot/sync/$(date +"%Y%m%d").sql | mysql ; echo SYNCED > /tmp/checksum_status ; chown dbascripts:dbascripts /tmp/checksum_status'
done
