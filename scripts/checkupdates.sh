#!/usr/bin/env bash

canUpdate=$(checkupdates | wc -l)

if [ "$canUpdate" -gt 0 ]; then
  echo "  ${canUpdate}"
else
  echo ""
fi
