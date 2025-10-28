:: --- CMD doskey macros ---
:: These replicate the provided .bat wrappers as doskey macros for interactive cmd.exe.
doskey ci=composer install $*
doskey cu=composer update $*
doskey gc=git clone $*
doskey gp=git pull $*
doskey nd=npm run dev $*
doskey ni=npm i $*
doskey pa=php artisan $*
doskey pac=php artisan make:$*
doskey pam=php artisan migrate $*
doskey pamfs=php artisan migrate:fresh --seed $*
doskey pamr=php artisan migrate:rollback $*
doskey pams=php artisan migrate --seed $*
doskey pas=php artisan serve $*
