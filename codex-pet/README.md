# Nong Kaojai Codex Pet

![Nong KaoJai Codex Pet](./docs/pet-gif.gif)

Nong Kaojai is a Codex custom pet based on the Kaojai.ai teal chat-bubble mascot.

The pet package contains:

- `pet.json` - Codex pet manifest.
- `spritesheet.webp` - 1536x1872 animated pet atlas.
- `scripts/install.sh` - local installer for Codex.
- `docs/contact-sheet.png` - visual QA contact sheet.

## Install In Codex

From this repository:

```sh
./scripts/install.sh
```

The script installs the pet into:

```text
${CODEX_HOME:-$HOME/.codex}/pets/nong-kaojai
```

Restart Codex after installing if the pet list does not refresh immediately.

## Manual Install

```sh
mkdir -p "${CODEX_HOME:-$HOME/.codex}/pets/nong-kaojai"
cp pet.json spritesheet.webp "${CODEX_HOME:-$HOME/.codex}/pets/nong-kaojai/"
```

## Files Expected By Codex

```text
nong-kaojai/
  pet.json
  spritesheet.webp
```

The manifest points to `spritesheet.webp` by relative path, so both files must stay in the same pet folder.

## QA

The atlas was generated through the `hatch-pet` workflow and validated with:

- 1536x1872 WebP atlas.
- 192x208 frame cells.
- Transparent unused cells.
- No validation errors or warnings.

The `running` row includes a yellow antenna blink action.
