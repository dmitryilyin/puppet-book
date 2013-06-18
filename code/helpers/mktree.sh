#!/bin/sh
for m in acpid ntp vimuser motd; do
  find "${m}" | grep -v '/log' > "${m}/log/tree.log";
done
