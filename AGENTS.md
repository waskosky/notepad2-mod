# Repository Guidelines

## Project Structure & Module Organization
- `src/`: Core application sources (e.g., `Notepad2.c`, dialogs, helpers).
- `scintilla/`: Scintilla editor component (static library) built as part of the solution.
- `res/`: Icons, resources, and `.rc` definitions.
- `build/`: Visual Studio solution (`Notepad2.sln`) and build/packaging scripts.
- `bin/VS2017/…`: Build outputs, e.g., `bin\VS2017\Release_x64\Notepad2.exe`.
- `distrib/`: Installer and packaging assets.

## Build, Test, and Development Commands
- `build` — Rebuild Release for x86 and x64; prints output paths.
- `build x64` — Rebuild x64 Release. Example: `build x86 Debug` for 32‑bit Debug.
- MSBuild (direct): `MSBuild.exe build\Notepad2.sln /t:Build /p:Configuration=Release;Platform=x64`.
- Open in IDE: `build\Notepad2.sln` (Visual Studio 2017+; Toolset v141, Windows 10 SDK).

## Coding Style & Naming Conventions
- Language: C/C++ (Win32 API + Scintilla).
- Indentation: spaces, 2 spaces per level; keep existing alignment.
- Braces: open on a new line for functions/blocks.
- Naming: functions `PascalCase` (e.g., `FileLoad`, `EditLoadFile`); macros/consts ALL_CAPS; resource IDs ALL_CAPS.
- Keep diffs focused; avoid drive‑by formatting of unrelated code.

## Testing Guidelines
- No formal automated tests in this repo; perform targeted manual checks:
  - Load/save files, encodings, and EOLs; status bar updates.
  - File Change Notification: modify file on disk and verify auto‑reload/merge and conflict highlight.
  - Scintilla features: folding, bookmarks, mark occurrences, large files.
- Build both x86/x64 Release before proposing changes.

## Commit & Pull Request Guidelines
- Commits: imperative subject, concise body explaining rationale and scope.
- Reference issues (e.g., `Fixes #123`) when applicable.
- PRs: include a brief description, reproduction steps, before/after notes, and screenshots when UI changes.
- Keep PRs small and cohesive; update docs if behavior or build steps change.

## Security & Configuration Tips
- Required: Visual Studio Build Tools 2017+ (C++ tools) and Windows 10 SDK. Toolset: `v141`; XP toolset not required.
- Outputs land under `bin\VS2017\<Config>_<Arch>\`.
