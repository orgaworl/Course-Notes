#!/bin/sh
# -------------------------------------
cat ./updateGit.sh
git pull
curDate="$(date --rfc-3339=date)"
git add .
git commit -m $curDate
git push
# --------------------------------------
