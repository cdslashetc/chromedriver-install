#!/bin/bash
cd /usr
d=$(date --iso-8601)
tar cvf local-$d.tar $(find local -mtime -1)
pxz -v9 local-$d.tar
