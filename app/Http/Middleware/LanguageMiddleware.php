<?php

namespace App\Http\Middleware;

use Closure;

class LanguageMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {

        if (session()->has('lang') && session()->get('lang') == 'en') {
            app()->setlocale('en');
        }else{
            app()->setlocale('ar');
        }

        return $next($request);
    }
}
