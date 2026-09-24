#!/bin/sh

file="$1"

# --- DIRECTORIES ---
if [ -d "$file" ]; then
    if command -v eza >/dev/null 2>&1; then
        exec eza --tree --level=2 --icons "$file"
    elif command -v tree >/dev/null 2>&1; then
        exec tree -L 2 "$file"
    else
        exec ls -la "$file"
    fi
fi

case "$(printf '%s' "$file" | tr '[:upper:]' '[:lower:]')" in
    # --- IMAGES (Dimensions & EXIF metadata) ---
    *.jpg|*.jpeg|*.png|*.gif|*.webp|*.bmp|*.ico|*.tiff|*.svg)
        if command -v exiftool >/dev/null 2>&1; then
            exec exiftool -ImageSize -FileType -FileSize -ColorSpace "$file"
        elif command -v mediainfo >/dev/null 2>&1; then
            exec mediainfo "$file"
        else
            exec file "$file"
        fi
        ;;

    # --- PDF DOCUMENTS (Text extraction) ---
    *.pdf)
        if command -v pdftotext >/dev/null 2>&1; then
            exec pdftotext -l 5 -q "$file" -
        elif command -v exiftool >/dev/null 2>&1; then
            exec exiftool -Title -Author -PageCount "$file"
        else
            exec file "$file"
        fi
        ;;

    # --- ARCHIVES (Contents listing) ---
    *.tar*|*.tgz|*.tbz2|*.txz)
        exec tar -tvf "$file"
        ;;
    *.zip)
        if command -v unzip >/dev/null 2>&1; then
            exec unzip -l "$file"
        fi
        ;;
    *.7z)
        if command -v 7z >/dev/null 2>&1; then
            exec 7z l "$file"
        fi
        ;;

    # --- MEDIA / AUDIO (Tags & Codec info) ---
    *.mp3|*.flac|*.m4a|*.wav|*.ogg|*.mp4|*.mkv|*.avi|*.mov)
        if command -v mediainfo >/dev/null 2>&1; then
            exec mediainfo "$file"
        fi
        ;;

    # --- JSON (Formatted structure) ---
    *.json)
        if command -v jq >/dev/null 2>&1; then
            exec jq -C '.' "$file" 2>/dev/null
        fi
        ;;
esac

# --- DEFAULT TEXT / CODE PREVIEW ---
if command -v bat >/dev/null 2>&1; then
    exec bat --color=always --style=numbers --line-range=:200 "$file"
else
    exec cat "$file"
fi
