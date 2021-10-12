<?php

namespace App\Http\Middleware;

use Closure;
use App\Models\Permission;

class CreatePermissionMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param \Illuminate\Http\Request $request
     * @param \Closure $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
    //    die(auth()->user()->can('collection index'));
        if (isset($request->route()->getAction()['as']) && !empty($request->route()->getAction()['as'])) {
            $route = $request->route()->getAction()['as'];
            $route = str_replace('.', ' ', $route);
            $route = str_replace('_', ' ', $route);
            $route = str_replace('-', ' ', $route);
            $permissionData = [
                'guard_name' => 'web',
                'name' => $route,
//            'display_name'=>$route
            ];
            $oldPermission = Permission::where([
                'guard_name' => 'web',
                'name' => $route
            ])->first();

         
            if (!$oldPermission) {
                Permission::create($permissionData);
            }
        }
            return $next($request);

    }
}
