# Workflow Stack

## Editor Layer

| Tool / Setup | Purpose |
|--------------|----------|
| VS Code (Vim Workflow) | Main IDE configured to behave like a modal editor with Vim-style navigation and leader-based commands. |
| VSCodeVim | Vim emulation layer enabling modal editing, motions, and custom leader mappings. |
| Code Telescope | Telescope-like fuzzy finder for VS Code used for files, grep, diagnostics, breakpoints, and other navigation workflows. |
| settings.json | Central configuration file where editor behavior, Vim mappings, UI tweaks, and extension settings are defined. |
| keybindings.json | Native VS Code keyboard shortcut configuration used for system-level keybindings outside the Vim layer. |

### VS Code Extensions Used

| Extension | Purpose |
|-----------|----------|
| VSCodeVim | Modal editing and Vim keybindings. |
| Code Telescope | Fuzzy finder interface similar to Neovim Telescope. |

---

## Terminal Layer

| Tool / Setup | Purpose |
|--------------|----------|
| Alacritty | GPU-accelerated, cross-platform terminal emulator optimized for speed and minimalism. |
| tmux + tmux-sessionizer (tms) | Project-scoped terminal sessions to avoid terminal sprawl and preserve context. |

---

## Editor (Terminal-based)

| Tool / Setup | Purpose |
|--------------|----------|
| LazyVim | Pre-configured Neovim distribution providing LSP, plugin management, and modern defaults with minimal setup. |

---

## Window Management

| Tool / Setup | Purpose |
|--------------|----------|
| PaperWM (with vim-style navigation) | Infinite horizontal tiling inside GNOME with hjkl-based window movement for fully keyboard-driven spatial control. |
| Pin to Dash (Dock) | Workspace-specific application launching for deterministic app traversal within each workspace. |

---

## Documentation

| Tool / Setup | Purpose |
|--------------|----------|
| Zathura | Lightweight keyboard-driven PDF viewer for focused documentation reading. |

---

## System Base

| Tool / Setup | Purpose |
|--------------|----------|
| Omakub | Opinionated Ubuntu baseline providing a streamlined development environment foundation. |
