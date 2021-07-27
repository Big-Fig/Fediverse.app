#!/bin/sh
fvm flutter test --no-pub --no-null-assertions --no-track-widget-creation --total-shards 3 --shard-index 0 test &
fvm flutter test --no-pub --no-null-assertions --no-track-widget-creation --total-shards 3 --shard-index 1 test &
fvm flutter test --no-pub --no-null-assertions --no-track-widget-creation --total-shards 3 --shard-index 2 test &
