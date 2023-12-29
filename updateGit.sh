#!/bin/sh
curDate="$(date --rfc-3339=date)"
git add .
git commit -m $curDate
git push
