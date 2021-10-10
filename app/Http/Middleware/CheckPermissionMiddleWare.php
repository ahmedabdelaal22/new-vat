<?php

namespace App\Http\Middleware;

use Closure;

class CheckPermissionMiddleWare
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
        $route = $request->route()->getAction()['as'];
        $route = str_replace('.', ' ', $route);
        $route = str_replace('_', ' ', $route);
        $route = str_replace('-', ' ', $route);


        if (strpos($route,'store')){
            $route = str_replace('store', 'create', $route);
        }
        else if (strpos($route,'update show')){
            $route = str_replace('update show', 'update show', $route);
        }

        else if (strpos($route,'update phones')){
            $route = str_replace('update phones', 'update phones', $route);
        }

        else if (strpos($route,'update')){
            $route = str_replace('update', 'edit', $route);
        }



//
//
//
//        print_r($route);exit;
        if (!Auth()->user()->is_super_admin) {
            if (!Auth()->user()->can($route)) {
                if ($request->ajax()) {
                    return responseJson(0,trans('main.not_have_permissions'));
                }

                return redirect()->route('not_allowed');
            }
        }
        return $next($request);
    }
}
