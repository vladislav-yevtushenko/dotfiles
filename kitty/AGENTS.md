# Repository Guidelines

## Project Structure & Module Organization
- `kitty.conf`: Main entry. Keep minimal; include modular files via `include conf.d/*.conf`.
- `conf.d/`: Split settings by concern (e.g., `10-keys.conf`, `20-fonts.conf`, `30-window.conf`, `40-performance.conf`). Lowercase, hyphenated names; numeric prefixes control load order.
- `themes/`: Color schemes (`<name>.conf`). Switch by including a single theme file from `kitty.conf`.
- `sessions/`: Reusable window/tab layouts (`*.session`). Launch with `kitty --session ./sessions/<file>.session`.
- `kittens/` (optional): Custom kittens (Python). One folder per kitten.
- `scripts/` (optional): Helper shell scripts to toggle themes or sessions.

## Build, Test, and Development Commands
- Validate config: `kitty --debug-config --config ./kitty.conf` (prints parse and warnings).
- Dry-run nested instance: `kitty --single-instance=no --config ./kitty.conf` (tests changes without impacting a running kitty).
- Apply a session: `kitty --session ./sessions/dev.session` (verifies layouts and titles).
- Theme preview: `kitty +kitten themes` (interactive preview; confirm chosen file in `themes/`).

## Coding Style & Naming Conventions
- Format: One setting per line; comments with `#`; spaces, not tabs.
- Keys/values: Use official option names; keep values quoted only when required by Kitty.
- File names: lowercase-hyphenated; use `.conf` for configs, `.session` for sessions.
- Organization: Keep machine- or OS-specific settings isolated (e.g., `90-os-macos.conf`). Avoid hardcoded user paths.

## Testing Guidelines
- Smoke test: Launch a fresh kitty with the modified config (see above).
- Keymap check: Verify critical shortcuts (copy/paste, splits, tabs) after changes in `keys` files.
- Kittens: If present, keep them self-contained; use `python -m pyflakes kittens/` if Python is used.

## Commit & Pull Request Guidelines
- Commits: Use Conventional Commits (e.g., `feat(theme): add nord`, `fix(keys): unshadow paste binding`, `docs: note macOS font fallback`).
- PRs: Provide a short summary, rationale, screenshots for visual changes (themes), and steps to validate (`kitty --debug-config ...`). Link related issues.

## Security & Configuration Tips
- Do not commit secrets or machine-specific absolute paths. Prefer `$HOME` and relative includes.
- Avoid destructive defaults (e.g., remapping close-tab to single key); place such choices in user-local overrides.
