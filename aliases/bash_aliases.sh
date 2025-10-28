#!/usr/bin/env bash
# === Bash/Fish-compatible aliases (Bash version) ===
# Generated from the provided Windows .bat alias set.
# Place: ~/.config/aliases/bash_aliases.sh
# Sourced by: ~/.bashrc (installer appends an idempotent block)

# Prefer functions so arguments are forwarded correctly.
ci(){ composer install "$@"; }
cu(){ composer update "$@"; }
gc(){ git clone "$@"; }
gp(){ git pull "$@"; }
nd(){ npm run dev "$@"; }
ni(){ npm i "$@"; }
pa(){ php artisan "$@"; }
pac(){ php artisan make:"$@"; }
pam(){ php artisan migrate "$@"; }
pamfs(){ php artisan migrate:fresh --seed "$@"; }
pamr(){ php artisan migrate:rollback "$@"; }
pams(){ php artisan migrate --seed "$@"; }
pas(){ php artisan serve "$@"; }
