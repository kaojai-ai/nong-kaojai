# Nong Kaojai Codex Pet

![Nong KaoJai Codex Pet](./docs/pet-gif.gif)

Nong Kaojai is a Codex custom pet based on the Kaojai.ai teal chat-bubble mascot. This folder is one toy inside the broader Kaojai toys and fun widgets collection.

## Package Contents

- `pet.json` - Codex pet manifest.
- `spritesheet.webp` - 1536x2288 v2 animated pet atlas.
- `scripts/install.sh` - local installer for Codex.
- `docs/pet-gif.gif` - quick animated preview.
- `docs/contact-sheet.png` - visual QA contact sheet.

## Install In Codex

From the repository root:

```sh
cd codex-pet
./scripts/install.sh
```

Or from this folder:

```sh
./scripts/install.sh
```

The script installs the pet into:

```text
${CODEX_HOME:-$HOME/.codex}/pets/nong-kaojai
```

Restart Codex after installing if the pet list does not refresh immediately.

## Install From A Release

Download `nong-kaojai-v2.zip` from [GitHub Releases](https://github.com/kaojai-ai/nong-kaojai/releases), then extract it into:

```text
${CODEX_HOME:-$HOME/.codex}/pets
```

The archive already contains the required `nong-kaojai/` directory.

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

## Animation Notes

- `idle` keeps the mascot calm with subtle blink and bob motion.
- `running-right` and `running-left` move the speech-bubble mascot without adding legs.
- `waving` uses a small temporary arm for the greeting.
- `running` is the active/in-progress loop and includes the yellow antenna blink.
- Rows 9-10 provide the v2 direction frames required by current Codex versions.
- Unused atlas cells are transparent.

## QA

The atlas was generated through the `hatch-pet` workflow and validated with:

- 1536x2288 WebP v2 atlas.
- 192x208 frame cells.
- Original visible design and actions preserved across rows 0-8.
- Blind cardinal-direction and independent final visual QA passed.
- Transparent unused cells.
- No validation errors or warnings.

See [`docs/contact-sheet.png`](./docs/contact-sheet.png) for the full row-by-row preview.

## Build A Shareable ZIP

From the repository root:

```sh
./codex-pet/scripts/build.sh
```

This creates `codex-pet/dist/nong-kaojai-v2.zip`. Every push to `main` runs the same build and publishes the ZIP as a uniquely tagged GitHub prerelease.
