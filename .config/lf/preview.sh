#!/bin/sh

file="$1"
width="${2:-80}"
height="${3:-40}"

# --- DIRECTORIES ---
if [ -d "$file" ]; then
    if command -v tree >/dev/null 2>&1; then
        exec tree -L 2 "$file"
    else
        exec ls -la "$file"
    fi
fi

# --- MIME TYPES ---
mime_type=$(file -b --mime-type "$file")

case "$mime_type" in
    # Images
    image/*)
        if command -v chafa >/dev/null 2>&1; then
            exec chafa --format=symbols --symbols=all --size="${width}x${height}" "$file"
        elif command -v exiftool >/dev/null 2>&1; then
            exec exiftool -ImageSize -FileType -FileSize "$file"
        else
            exec file "$file"
        fi
        ;;

    # PDF Documents
    application/pdf)
        if command -v pdftotext >/dev/null 2>&1; then
            exec pdftotext -l 5 -q "$file" -
        elif command -v exiftool >/dev/null 2>&1; then
            exec exiftool -Title -Author -PageCount "$file"
        else
            exec file "$file"
        fi
        ;;

    # JSON Data
    application/json)
        if command -v jq >/dev/null 2>&1; then
            exec jq -C '.' "$file" 2>/dev/null
        fi
        ;;

    # Archives (handled entirely by bsdtar or libarchive tar)
    application/zip|application/x-tar|application/x-7z-compressed|application/x-gtar|application/x-bzip2|application/x-gzip|application/x-xz|application/x-rar|application/x-iso9660-image)
        if command -v bsdtar >/dev/null 2>&1; then
            exec bsdtar -tf "$file"
        elif command -v tar >/dev/null 2>&1; then
            exec tar -tf "$file"
        fi
        ;;

    # Audio & Video
    audio/*|video/*)
        if command -v mediainfo >/dev/null 2>&1; then
            exec mediainfo "$file"
        elif command -v exiftool >/dev/null 2>&1; then
            exec exiftool "$file"
        fi
        ;;
esac

# --- FALLBACK: BINARY VS TEXT (MIME ENCODING) ---
mime_encoding=$(file -b --mime-encoding "$file")

case "$mime_encoding" in
    binary)
        if command -v xxd >/dev/null 2>&1; then
            exec xxd -g 1 -c 16 "$file"
        elif command -v hexdump >/dev/null 2>&1; then
            exec hexdump -C "$file"
        else
            exec file "$file"
        fi
        ;;
    *)
        if command -v bat >/dev/null 2>&1; then
            exec bat --color=always --style=numbers --line-range=:$height "$file"
        else
            exec cat "$file"
        fi
        ;;
esac
