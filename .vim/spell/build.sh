#!/usr/bin/env bash
# Rebuild spell/nl.utf-8.spl and spell/pt.utf-8.spl from the current
# LibreOffice hunspell dictionaries (OpenTaal nl_NL, VERO pt_BR).
# Usage: spell/build.sh   (needs curl and vim; pt takes ~1 min and ~1.3 GB RAM)
set -euo pipefail
export LC_ALL=C  # byte-wise sed on both BSD and GNU

src=https://raw.githubusercontent.com/LibreOffice/dictionaries/master
out=$(cd "$(dirname "$0")" && pwd)
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

fetch() {
    curl -fsSL "$src/$1/$1.aff" | sed '1s/^\xEF\xBB\xBF//' > "$tmp/$1.aff"
    curl -fsSL "$src/$1/$1.dic" | sed '1s/^\xEF\xBB\xBF//' > "$tmp/$1.dic"
}

mkspell() {
    vim -u NONE -N -es --cmd 'set enc=utf-8 mkspellmem=900000,3000,800' \
        -c "mkspell! $out/$1 $tmp/$2" -c 'qa!' >/dev/null
}

fetch nl_NL
# Vim ignores ICONV, so spell the ij ligature out
sed -i.bak -e 's/ĳ/ij/g' -e 's/Ĳ/IJ/g' "$tmp/nl_NL.aff" "$tmp/nl_NL.dic"
# Vim needs: a condition on every affix line, COMPOUNDMIN >= 1, COMPOUNDRULE
# flags without (), and COMPOUNDBEGIN/MIDDLE/END written as a COMPOUNDRULE
awk '
    NR == FNR { if ($1 ~ /^COMPOUND(BEGIN|MIDDLE|END)$/) f[$1] = $2; next }
    ($1 == "SFX" || $1 == "PFX") && NF == 4 && $3 !~ /^[YN]$/ { print $1, $2, $3, $4, "."; next }
    $1 == "COMPOUNDMIN" && $2 < 1 { print "COMPOUNDMIN 1"; next }
    $1 == "COMPOUNDRULE" && $2 ~ /^[0-9]+$/ {
        print "COMPOUNDRULE", $2 + 1
        print "COMPOUNDRULE", f["COMPOUNDBEGIN"] f["COMPOUNDMIDDLE"] "*" f["COMPOUNDEND"]
        next
    }
    $1 == "COMPOUNDRULE" { gsub(/[()]/, "", $2); print $1, $2; next }
    { print }
' "$tmp/nl_NL.aff" "$tmp/nl_NL.aff" > "$tmp/nl.aff" && mv "$tmp/nl.aff" "$tmp/nl_NL.aff"
grep -qE '^COMPOUNDRULE [^ *]+\*[^ ]+$' "$tmp/nl_NL.aff" || { echo "nl_NL.aff: no COMPOUNDBEGIN/END flags found" >&2; exit 1; }
mkspell nl nl_NL
# a .sug from an older build would no longer match the .spl
rm -f "$out/nl.utf-8.sug"

fetch pt_BR
mkspell pt pt_BR

ls -l "$out"/*.spl
