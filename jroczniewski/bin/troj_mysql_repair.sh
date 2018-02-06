#!/bin/bash

for x in {1..5}; do
  echo repairing orkan${x}
  ssh jroot@orkan${x} '/root/bin/make_sync_sql.sh | tee /home/jroot/sync/$(date +"%Y%m%d").sql | mysql ; echo SYNCED > /tmp/checksum_status ; chown dbascripts:dbascripts /tmp/checksum_status'
done
