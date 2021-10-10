<!--begin: Datatable -->
<!-- <table class="table table-striped- table-bordered table-hover table-checkable" id="m_table_1"> -->
<!--begin::Form-->
{!! Form::open(['method'=>'post','route'=>'role_permissions.store','files'=>'true','class'=>'m-form m-form--fit
                m-form--label-align-right'])!!}
<div class="table-responsive">
<table class="table table-bordered dataTable table-hover table-checkable
                         table-striped m-table m-table--head-bg-success custom_table users_role_permissions" id="scrolled_table">
    <thead>
    <tr>
        <th>#</th>
        <th>#</th>
        @foreach($roles as $role)
            <th> 
                <span> {{$role->name}}</span>
                <label class="m-checkbox m-checkbox--single m-checkbox--solid m-checkbox--brand">
                    <input type="checkbox" class="m-checkable th-role-{{$role->id}}" onclick='checkAll("role-{{$role->id}}")'>
                    <span></span>
                </label>
            </th>
        @endforeach
    </tr>
    </thead>
    <tbody>
    @foreach($permissions as $permission)

        <tr class="table_tr">
            <td>{!!$permission->name!!}</td>
            <td>{!!($permission->guard_name == 'web') ? trans('main.cpanel'): trans('main.application')!!}</td>


            @foreach($roles as $role)
                <td>
                    <div class="m-checkbox-list"  align="center">
                        <label class="m-checkbox m-checkbox--single m-checkbox--solid m-checkbox--brand">
                            <input type="checkbox" class="m-checkable role-{{$role->id}}" name="role[{{$role->id}}][]"
                                   value="{{$permission->id}}"

                                {{($roles_permissions->where('role_id',$role->id)->where('permission_id',$permission->id)->first()) ? 'checked' : ''}}
                            >
                            <span></span>
                        </label>
                    </div>

                </td>
            @endforeach


        </tr>
    @endforeach
    </tbody>
</table>
</div>
<div class="m-portlet__foot m-portlet__foot--fit">
    <div class="m-form__actions role_permissions_btn">
        <button type="submit" class="btn btn-primary">{!! trans('main.save') !!}</button>
    </div>
</div>

{!!Form::close()!!}
<!--end::Form-->
@section('scripts')
<script type="text/javascript">

   function checkAll(target_role_str){ 
       
   $('.'+target_role_str).prop("checked",$('.th-'+target_role_str).is(":checked"));

    }


    
</script>
@endsection