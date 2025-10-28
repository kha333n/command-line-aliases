# --- Fish aliases (auto-sourced via conf.d) ---
# Generated from the provided Windows .bat alias set.
# Place: ~/.config/fish/conf.d/aliases.fish

function ci; composer install $argv; end
function cu; composer update $argv; end
function gc; git clone $argv; end
function gp; git pull $argv; end
function nd; npm run dev $argv; end
function ni; npm i $argv; end
function pa; php artisan $argv; end
function pac; php artisan make:$argv; end
function pam; php artisan migrate $argv; end
function pamfs; php artisan migrate:fresh --seed $argv; end
function pamr; php artisan migrate:rollback $argv; end
function pams; php artisan migrate --seed $argv; end
function pas; php artisan serve $argv; end
