#!/usr/bin/env sh
set -eu

tmp_dir="$(mktemp -d)"
trap 'rm -rf "$tmp_dir"' EXIT INT TERM

en_list="$tmp_dir/en.txt"
nl_list="$tmp_dir/nl.txt"
unsuffixed_list="$tmp_dir/unsuffixed.txt"

: > "$en_list"
: > "$nl_list"
: > "$unsuffixed_list"

find content -type f -name '*.md' | LC_ALL=C sort | while IFS= read -r file; do
  rel="${file#content/}"
  case "$rel" in
    *.en.md)
      printf '%s\n' "${rel%.en.md}" >> "$en_list"
      ;;
    *.nl.md)
      printf '%s\n' "${rel%.nl.md}" >> "$nl_list"
      ;;
    *)
      printf '%s\n' "$rel" >> "$unsuffixed_list"
      ;;
  esac
done

sort -u "$en_list" -o "$en_list"
sort -u "$nl_list" -o "$nl_list"

has_error=0

if [ -s "$unsuffixed_list" ]; then
  echo "ERROR: All markdown content must be internationalized as .en.md and .nl.md files."
  echo "Unsuffixed files found:"
  cat "$unsuffixed_list"
  has_error=1
fi

missing_nl="$(comm -23 "$en_list" "$nl_list" || true)"
if [ -n "$missing_nl" ]; then
  echo "ERROR: Missing Dutch translations for:"
  printf '%s\n' "$missing_nl"
  has_error=1
fi

missing_en="$(comm -13 "$en_list" "$nl_list" || true)"
if [ -n "$missing_en" ]; then
  echo "ERROR: Missing English translations for:"
  printf '%s\n' "$missing_en"
  has_error=1
fi

if [ "$has_error" -ne 0 ]; then
  exit 1
fi

echo "OK: All markdown content has matching .en.md and .nl.md translations."
