# ------------------------------
# Utility functions
# ------------------------------
compress() { tar -czf "${1%/}.tar.gz" "${1%/}"; }
alias decompress="tar -xzf"

transcode-video-1080p() {
  ffmpeg -i "$1" -vf scale=1920:1080 -c:v libx264 -preset fast -crf 23 -c:a copy "${1%.*}-1080p.mp4"
}

transcode-video-4K() {
  ffmpeg -i "$1" -c:v libx265 -preset slow -crf 24 -c:a aac -b:a 192k "${1%.*}-optimized.mp4"
}

img2jpg() {
  local img="$1"
  shift
  magick "$img" "$@" -quality 95 -strip "${img%.*}-optimized.jpg"
}

img2jpg-small() {
  local img="$1"
  shift
  magick "$img" "$@" -resize 1080x\> -quality 95 -strip "${img%.*}-optimized.jpg"
}

img2png() {
  local img="$1"
  shift
  magick "$img" "$@" -strip \
    -define png:compression-filter=5 \
    -define png:compression-level=9 \
    -define png:compression-strategy=1 \
    -define png:exclude-chunk=all \
    "${img%.*}-optimized.png"
}

nvimf() {
  local selection
  selection=$(fzf --preview 'bat --color=always --style=header,grid --line-range :400 {}')
  [[ -n "$selection" ]] && nvim "$selection"
}

