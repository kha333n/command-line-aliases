# --- PowerShell aliases ---
# These mirror the provided Windows .bat alias set but for PowerShell profiles.
function ci { param([Parameter(ValueFromRemainingArguments=$true)]$Args) composer install @Args }
function cu { param([Parameter(ValueFromRemainingArguments=$true)]$Args) composer update @Args }
function gc { param([Parameter(ValueFromRemainingArguments=$true)]$Args) git clone @Args }
function gp { param([Parameter(ValueFromRemainingArguments=$true)]$Args) git pull @Args }
function nd { param([Parameter(ValueFromRemainingArguments=$true)]$Args) npm run dev @Args }
function ni { param([Parameter(ValueFromRemainingArguments=$true)]$Args) npm i @Args }
function pa { param([Parameter(ValueFromRemainingArguments=$true)]$Args) php artisan @Args }
function pac { param([Parameter(ValueFromRemainingArguments=$true)]$Args) php artisan make:@Args }
function pam { param([Parameter(ValueFromRemainingArguments=$true)]$Args) php artisan migrate @Args }
function pamfs { param([Parameter(ValueFromRemainingArguments=$true)]$Args) php artisan migrate:fresh --seed @Args }
function pamr { param([Parameter(ValueFromRemainingArguments=$true)]$Args) php artisan migrate:rollback @Args }
function pams { param([Parameter(ValueFromRemainingArguments=$true)]$Args) php artisan migrate --seed @Args }
function pas { param([Parameter(ValueFromRemainingArguments=$true)]$Args) php artisan serve @Args }
