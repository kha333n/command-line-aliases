# Cross‑Shell Aliases (Bash, Fish, PowerShell, CMD)

This repository installs the same handy dev aliases across **Linux/macOS (Bash + Fish)** and **Windows (PowerShell + CMD)**.

- POSIX installer configures **both Bash and Fish** automatically in one run (if both are present).
- Windows installer configures **PowerShell + CMD** in one run.
- Idempotent: safe to re-run — profile blocks are marked.
- Per-user install: writes to `~/.config/aliases` (POSIX) and `%USERPROFILE%\.config\aliases` (Windows).

---

## Quick Start

Raw base for this repository:
`https://raw.githubusercontent.com/kha333n/command-line-aliases/master`

### Linux/macOS (Bash + Fish together)
```bash
/bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/kha333n/command-line-aliases/master/install/install-aliases.sh)"
# or
# /bin/sh -c "$(wget -qO- https://raw.githubusercontent.com/kha333n/command-line-aliases/master/install/install-aliases.sh)"
```
After install:
- Bash: `source ~/.bashrc` (or open a new terminal)
- Fish: `exec fish` (or open a new Fish session)

### Windows (PowerShell + CMD together)
```powershell
irm https://raw.githubusercontent.com/kha333n/command-line-aliases/master/install/install-aliases.ps1 | iex
```
After install:
- PowerShell: `. $PROFILE` (or restart session)
- CMD: open a new `cmd.exe` window

---

## What gets installed

**Aliases (all shells)** — mapped as functions/macros with argument forwarding:
- `ci` → `composer install`
- `cu` → `composer update`
- `gc` → `git clone`
- `gp` → `git pull`
- `nd` → `npm run dev`
- `ni` → `npm i`
- `pa` → `php artisan`
- `pac` → `php artisan make:<...>`
- `pam` → `php artisan migrate`
- `pamfs` → `php artisan migrate:fresh --seed`
- `pamr` → `php artisan migrate:rollback`
- `pams` → `php artisan migrate --seed`
- `pas` → `php artisan serve`

**Files:**
```
aliases/
  bash_aliases.sh
  fish_aliases.fish
  powershell_aliases.ps1
  cmd_aliases.cmd
install/
  install-aliases.sh
  install-aliases.ps1
```

---

## How it works

- **Bash**: downloads `aliases/bash_aliases.sh` to `~/.config/aliases/bash_aliases.sh`
  and appends an idempotent block to `~/.bashrc` that sources it.
- **Fish**: downloads `aliases/fish_aliases.fish` to `~/.config/fish/conf.d/aliases.fish`
  (auto-sourced by Fish).
- **PowerShell**: downloads `aliases/powershell_aliases.ps1` to
  `%USERPROFILE%\.config\aliases\powershell_aliases.ps1` and appends a marked
  source block to `$PROFILE` if missing.
- **CMD**: downloads `aliases/cmd_aliases.cmd` and sets the registry value
  `HKCU\Software\Microsoft\Command Processor\AutoRun` so each new `cmd.exe` loads your macros.

---

## Troubleshooting

- **Bash changes don’t appear:** run `source ~/.bashrc` or open a new terminal.
- **Fish changes don’t appear:** run `exec fish` or open a new Fish session.
- **PowerShell blocked by execution policy:** in an elevated PowerShell:
  ```powershell
  Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
  ```
- **CMD macros not loading:** ensure `AutoRun` is set under
  `HKCU\Software\Microsoft\Command Processor` and open a new `cmd.exe`.
- **No `curl`/`wget` on POSIX:** install either (`sudo apt install curl` or `brew install curl`). 

---

## Uninstall

- Remove the alias files:
  - POSIX: `rm -f ~/.config/aliases/bash_aliases.sh ~/.config/fish/conf.d/aliases.fish`
  - Windows: delete `%USERPROFILE%\.config\aliases\powershell_aliases.ps1` and `cmd_aliases.cmd`
- Remove the marked profile blocks:
  - Bash: delete the lines between `### ALIASES:BEGIN ###` / `### ALIASES:END ###` in `~/.bashrc`
  - PowerShell: delete the lines between `# >>> ALIASES:BEGIN >>>` / `# <<< ALIASES:END <<<` in `$PROFILE`
- CMD: clear the AutoRun value:
  ```powershell
  Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Command Processor" -Name AutoRun -ErrorAction SilentlyContinue
  ```

---

## Customizing

Edit the alias files in `aliases/` to add or change shortcuts. Re-run the installer to update profiles.
