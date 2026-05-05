#!/usr/bin/env sh
set -eu

PET_ID="nong-kaojai"
SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
REPO_DIR=$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)
CODEX_HOME_DIR="${CODEX_HOME:-$HOME/.codex}"
TARGET_DIR="$CODEX_HOME_DIR/pets/$PET_ID"

if [ ! -f "$REPO_DIR/pet.json" ]; then
  echo "pet.json not found in $REPO_DIR" >&2
  exit 1
fi

if [ ! -f "$REPO_DIR/spritesheet.webp" ]; then
  echo "spritesheet.webp not found in $REPO_DIR" >&2
  exit 1
fi

mkdir -p "$TARGET_DIR"
cp "$REPO_DIR/pet.json" "$TARGET_DIR/pet.json"
cp "$REPO_DIR/spritesheet.webp" "$TARGET_DIR/spritesheet.webp"

echo "Installed $PET_ID to $TARGET_DIR"
