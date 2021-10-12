<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Role;
use App\Models\RolePermission;
use App\Models\Permission;

class RolePermissionController extends Controller
{
    public function index()
    {

        $roles = Role::get();
        $permissions = Permission::where('guard_name', 'web')->get();
        $roles_permissions = RolePermission::latest()->get();

        return view('role_permissions.index', compact('roles', 'permissions', 'roles_permissions'));
    }

    public function create()
    {
        return view('role_permissions.create');
    }

    public function store(Request $request)
    {

        RolePermission::truncate();

        if (!empty($request->role)) {

            foreach ($request->role as $role => $permissions) {


                $rolePermission=Role::findOrFail($role);
                $rolePermission->syncPermissions($permissions);

            }

            // app()->make(\Spatie\Permission\PermissionRegistrar::class)->forgetCachedPermissions();


            // // foreach (User::get() as $user) {
            // //     // dd($user);
            // //     $user->syncRoles($user->role_id);

            // // }
        }


        toast(trans('main.saved_successfully'), 'success', 'top-right');
        return redirect()->route('role_permissions.index');
    }

    public function show($id)
    {
        //
    }

    public function edit($id)
    {
        $resource = RolePermission::findOrFail($id);
        return view('role_permissions.edit', compact('resource'));
    }

    public function update(Request $request, $id)
    {

        $this->validate($request, [
            'name' => 'required|string|max:191',

        ]);

        $requests = $request->all();
        $resource = RolePermission::findOrFail($id);
        $resource->update($requests);
        toast(trans('main.saved_successfully'), 'success', 'top-right');
        return redirect()->route('role_permissions.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */

    public function destroy($id)
    {
        RolePermission::destroy($id);
        return responseJson(1, trans('main.deleted_successfully'), ['id' => $id]);
    }
}