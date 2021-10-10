{{--@php--}}
{{--   dd(App\Models\User::join("users as u_manager","u_manager.id","=","users.manager_id")->get()->pluck('name','id'));--}}
{{--@endphp--}}
<div class="m-portlet__body">
    <div class="form-group m-form__group row users_create_form">
        <div class="col-lg-4">
            <label for="name">{!! trans('main.name') !!}</label>
            {!! Form::text('name',null,['class'=>'form-control
            m-input','id'=>'name','placeholder'=>trans('main.name')])!!}
        </div>
        <div class="col-lg-4">
            <label for="email">{!! trans('main.email') !!}</label>
            {!! Form::text('email',null,['class'=>'form-control
            m-input','id'=>'email','placeholder'=>trans('main.email')])!!}
        </div>
        <div class="col-lg-4">
            <label for="password">{!! trans('main.password') !!}</label>
            {!! Form::password('password',['class'=>'form-control
            m-input','id'=>'password','placeholder'=>trans('main.password')])!!}
        </div>
        <div class="col-lg-4">
            <label for="password_confirmation">{!! trans('main.password_confirmation') !!}</label>
            {!! Form::password('password_confirmation',['class'=>'form-control
            m-input','id'=>'password_confirmation','placeholder'=>trans('main.password_confirmation')])!!}
        </div>
        
        <div class="col-lg-4 role_id_div">

            <label for="role_id">{{trans('main.role')}}</label>
            {!! Form::select('role_id',App\Models\Role::
                where(function ($q)  {
                    if(!Auth()->user()->is_super_admin && isset(Auth()->user()->roles[0]))
                        $q->where('roles.id', '=',Auth()->user()->roles[0]->id );
            })->pluck('name_'.app()->getLocale(),'id'),(!Auth()->user()->is_super_admin && isset(Auth()->user()->roles[0]))?Auth()->user()->roles[0]->id:$resource->roles()->pluck('id')->toArray(),['class'=>'form-control
            m-input m-select2 select2','id'=>'role_id','style'=>'width:100%','placeholder'=>trans('main.role')])!!}

        </div>
        <div class="col-lg-4 role_id_div">
            <label for="manager_id">{!! trans('main.manager') !!}</label>
            {!! Form::select('manager_id',App\Models\User::where("is_manager",1)->where(function($q){

                        if(!Auth()->user()->is_super_admin){
                            $q->where("team_leader_id",Auth()->user()->id);
                            $q->orWhere("manager_id",Auth()->user()->id);
                            $q->orWhere("id",Auth()->user()->id);
                        }

            })->get()->pluck('name','id'),$resource->manager_id,['class'=>'form-control
            m-input select2','id'=>'manager_id','placeholder'=>trans('main.manager')])!!}
        </div>
        <div class="col-lg-4 role_id_div">
            <label for="team_leader_id">{!! trans('main.team_leader') !!}</label>
            {!! Form::select('team_leader_id',App\Models\User::where("is_team_leader",1)->where(function($q){
                     if(!Auth()->user()->is_super_admin){
                            $q->where("team_leader_id",Auth()->user()->id);
                            $q->orWhere("manager_id",Auth()->user()->id);
                            $q->orWhere("id",Auth()->user()->id);
                        }

            })->get()->pluck('name','id'),$resource->team_leader_id,['class'=>'form-control
            m-input select2','id'=>'team_leader_id','placeholder'=>trans('main.team_leader')])!!}
        </div>
        <div class="col-lg-4">
            <label for="name">{!! trans('main.responsables') !!}</label>
            {!! Form::select('responsables[]',App\Models\User::
                where(function($q){
                 if(!Auth()->user()->is_super_admin){
                        $q->where("team_leader_id",Auth()->user()->id);
                        $q->orWhere("manager_id",Auth()->user()->id);
                        $q->orWhere("id",Auth()->user()->id);
                    }

                })->    
                get()->pluck('name','id'),$resource->responsables(),['class'=>'form-control
            m-input select2','multiple','id'=>'phones'])!!}
        </div>
        @if(Auth()->user()->is_super_admin)
            <div class="col-lg-4">
                <label for="imageInput"> {!! trans('main.image') !!} </label>
                <div class="custom-file">
                    <input type="file" class="form-control m-input custom-file-input" name="image" id="imageInput">
                    <label class="custom-file-label" for="customFile">{{trans('main.choose_file')}}</label>
                </div>
            </div>
            <div class="col-lg-4">
                <label for="name">الصلاحيات</label>
                <div class="m-checkbox-inline" id="is_super_admin_div">
                    <label class="m-checkbox">
                        <input type="checkbox" value="1" class="m-checkable" id="is_super_admin"
                               name="is_super_admin" {{ $resource->is_super_admin == "1" ? "checked" : "" }} >
                        {{trans("main.is_super_admin")}}
                        <span></span>
                    </label>
                </div>
            </div>
        @endif
    <div class="col-lg-4">
            <label for="name">{{trans("main.select_user_management_role")}}</label>
                <label class="m-checkbox">
                    <input type="checkbox" value="1" class="m-checkable" id="is_manager"
                           name="is_manager" {{ $resource->is_manager == "1" ? "checked" : "" }} >
                    {{trans("main.is_manager")}}
                    <span></span>
                </label>

                <label class="m-checkbox">
                    <input type="checkbox" value="1" class="m-checkable" id="is_team_leader"
                           name="is_team_leader" {{ $resource->is_team_leader == "1" ? "checked" : "" }} >
                    {{trans("main.is_team_leader")}}
                    <span></span>
                </label>
        </div>
        <div class="col-lg-4 user_create_image">
            
            @if(!empty($resource->image) && file_exists(public_path().'/'.$resource->image))
                <img src="{{url($resource->image)}}">
            @endif
        </div>
        </div>
</div>
@section('scripts')
    <script type="text/javascript">
        $(document).on('click', '#is_super_admin', function (e) {
            checkIsAdmin();
        });

        $(document).ready(function () {

            checkIsAdmin();
        });
        ;

        function checkIsAdmin() {
            if ($('#is_super_admin').is(':checked')) {
                $('.role_id_div').hide();
            } else {
                $('.role_id_div').show();
            }
        }
    </script>
@endsection
