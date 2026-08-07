#!/usr/bin/env sh
set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
PET_DIR=$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)
OUTPUT_DIR="${1:-$PET_DIR/dist}"
PACKAGE_DIR="$OUTPUT_DIR/nong-kaojai"
VERSION_FILE="$PET_DIR/VERSION"

for required_file in VERSION pet.json spritesheet.webp; do
  if [ ! -f "$PET_DIR/$required_file" ]; then
    echo "$required_file not found in $PET_DIR" >&2
    exit 1
  fi
done

VERSION=$(tr -d '[:space:]' < "$VERSION_FILE")
if ! printf '%s\n' "$VERSION" | grep -Eq '^[0-9]+\.[0-9]+\.[0-9]+$'; then
  echo "VERSION must use MAJOR.MINOR.PATCH format" >&2
  exit 1
fi

ARCHIVE="$OUTPUT_DIR/nong-kaojai-v${VERSION}.zip"

mkdir -p "$OUTPUT_DIR"
rm -rf "$PACKAGE_DIR"
rm -f "$ARCHIVE"
mkdir -p "$PACKAGE_DIR"
cp "$PET_DIR/pet.json" "$PACKAGE_DIR/pet.json"
cp "$PET_DIR/spritesheet.webp" "$PACKAGE_DIR/spritesheet.webp"

(
  cd "$OUTPUT_DIR"
  zip -q -X -r "$(basename "$ARCHIVE")" "$(basename "$PACKAGE_DIR")"
)

echo "Built $ARCHIVE"
