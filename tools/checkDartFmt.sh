#!/bin/sh
# Inspired by https://robots.thoughtbot.com/use-git-hooks-to-automate-annoying-tasks

dart_files=$(git diff --name-only --diff-filter=ACM --cached | grep '.dart$')

[ -z "$dart_files" ] && exit 0

function checkfmt() {
  unformatted=$(dartfmt -n $dart_files)
  [ -z "$unformatted" ] && return 0

  echo >&2 "Dart files must be formatted with dartfmt."
  for fn in $unformatted; do
    echo >&2 " $fn"
  done

  return 1
}

checkfmt || fail=yes

[ -z "$fail" ] || exit 1

echo 'all okay?'
exit 0
