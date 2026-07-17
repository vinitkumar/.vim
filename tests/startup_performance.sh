#!/bin/sh

set -eu

repo_root=$(CDPATH='' cd -- "$(dirname -- "$0")/.." && pwd)
fixture_path="$repo_root/tests/fixtures/bin"
invocation_log=$(mktemp "${TMPDIR:-/tmp}/vim-appearance-invocations.XXXXXX")
trap 'rm -f "$invocation_log"' EXIT HUP INT TERM

start_ms=$(
  perl -MTime::HiRes=time -e 'printf "%.0f\n", time * 1000'
)
PATH="$fixture_path:$PATH" vim -Nu "$repo_root/vimrc" -i NONE -n -es \
  +'doautocmd VimEnter' \
  +qa
end_ms=$(
  perl -MTime::HiRes=time -e 'printf "%.0f\n", time * 1000'
)

elapsed_ms=$((end_ms - start_ms))
max_startup_ms=1000

if [ "$elapsed_ms" -ge "$max_startup_ms" ]; then
  printf 'not ok - startup waited %sms for macOS appearance detection\n' "$elapsed_ms"
  exit 1
fi

printf 'ok - startup did not wait for macOS appearance detection (%sms)\n' "$elapsed_ms"

if ! VIM_APPEARANCE_INVOCATION_LOG="$invocation_log" \
  PATH="$fixture_path:$PATH" \
  vim -Nu "$repo_root/vimrc" -i NONE -n -es \
  +'doautocmd VimEnter' \
  +'doautocmd FocusGained' \
  +'sleep 2300m' \
  +'if g:vimrc_appearance_cache !=# "dark" || &background !=# "dark" | cquit | endif' \
  +qa
then
  printf 'not ok - asynchronous macOS appearance was not applied\n'
  exit 1
fi

printf 'ok - asynchronous macOS appearance was applied\n'

invocation_count=$(wc -l < "$invocation_log")
if [ "$invocation_count" -ne 1 ]; then
  printf 'not ok - expected one appearance lookup, got %s\n' "$invocation_count"
  exit 1
fi

printf 'ok - overlapping appearance refresh was suppressed\n'
