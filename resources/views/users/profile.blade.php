@extends('layouts.app')
@section('title') {{trans('main.'.$basicRoute)}}@endsection
@section('header')@endsection

@if(Auth()->user()->is_super_admin || Auth()->user()->can("users index"))
@section('breadcrumb')
    @php($breadcrumbs=[trans('main.'.$basicRoute)=>route($basicRoute.'.index'),$resource->name =>route('profile',['id'
    => $resource->id])])
    @includeWhen(isset($breadcrumbs),'layouts._breadcrumb', ['breadcrumbs' =>$breadcrumbs ])
@endsection
@endif

@section('content')
    <div class="row">
        <div class="col-xl-3 col-lg-4">
            <div class="m-portlet m-portlet--full-height  ">
                <div class="m-portlet__body">
                    <div class="m-card-profile">
                        <div class="m-card-profile__title m--hide">
                            <!-- Your Profile -->
                        </div>
                        <div class="m-card-profile__pic">
                            <div class="m-card-profile__pic-wrapper" data-toggle="modal" data-target="#myModal">
                                <img src="{!!asset($resource->image)!!}" alt="">
                            </div>
                        </div>
                        <div class="m-card-profile__details">
                            <span class="m-card-profile__name">{{$resource->name}}</span>
                            <a href="" class="m-card-profile__email m-link">{{$resource->email}}</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-9 col-lg-8">
            <div class="m-portlet m-portlet--full-height m-portlet--tabs  ">
                <div class="m-portlet__head">
                    <div class="m-portlet__head-tools">
                        <ul class="nav nav-tabs m-tabs m-tabs-line   m-tabs-line--left m-tabs-line--primary"
                            role="tablist">
                            <li class="nav-item m-tabs__item">
                                <a class="nav-link m-tabs__link active" data-toggle="tab" href="#m_user_profile_tab_1"
                                   role="tab">
                                    <i class="flaticon-share m--hide"></i>

                                    {{trans('main.update_Profile')}}
                                </a>
                            </li>
                            <li class="nav-item m-tabs__item">
                                <a class="nav-link m-tabs__link" data-toggle="tab" href="#m_user_profile_tab_2"
                                   role="tab">
                                    {{trans('main.jobs')}}
                                </a>
                            </li>
                            <li class="nav-item m-tabs__item">
                                <a class="nav-link m-tabs__link" data-toggle="tab" href="#m_user_profile_tab_3"
                                   role="tab">
                                    {{trans('main.leads')}}
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>


                <div class="m-portlet__body ">
                    <div class="tab-content">
                        <div class="tab-pane active " id="m_user_profile_tab_1">
                            {!!  Form::model($resource,['method'=>'put','route'=>['users.update_profile',$resource->id],'files'=>'true','class'=>'m-form
                            m-form--fit m-form--label-align-right'])!!}

                            <div class="m-portlet__body">
                                <!-- <h3 class="m-form__section">{{trans('main.personal_details')}}</h3> -->
                                <div class="form-group m-form__group row">
                                    <div class="col-lg-6">
                                        <label for="example-text-input" class="col-form-label">{!! trans('main.name')
                                        !!}</label>
                                        <div class="">
                                            {!! Form::text('name',null,['class'=>'form-control
                                            m-input','id'=>'name','placeholder'=>trans('main.name')])!!} 
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <label for="example-text-input" class="col-form-label">{!! trans('main.email')
                                        !!}</label>
                                        <div class="">
                                            {!! Form::text('email',null,['class'=>'form-control
                                            m-input','id'=>'email','placeholder'=>trans('main.email')])!!}
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <label for="example-text-input" class="col-form-label">{!! trans('main.password')
                                    !!}</label>
                                    <div class="">
                                        {!! Form::password('password',['class'=>'form-control
                                        m-input','id'=>'password','placeholder'=>trans('main.password')])!!} </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <label for="example-text-input" class="col-form-label">{!!
                                    trans('main.password_confirmation') !!}</label>
                                    <div class="">
                                        {!! Form::password('password_confirmation',['class'=>'form-control
                                        m-input','id'=>'password_confirmation','placeholder'=>trans('main.password_confirmation')])!!}
                                    </div>
                                    </div>
                                </div>
                            </div>
                            <div class="m-portlet__foot m-portlet__foot--fit">
                                <div class="m-form__actions ">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <button type="submit" class="btn btn-accent m-btn m-btn--air m-btn--custom">
                                                {{trans('main.save')}}</button>&nbsp;&nbsp;

                                        </div>
                                    </div>
                                </div>
                            </div>

                            {!!Form::close()!!}
                        </div>


                        <div class="tab-pane  " id="m_user_profile_tab_2">
                            <div class="m-portlet__body">
                            <!--Begin::Timeline 3 -->
                            <div class="m-timeline-3">
                                <div class="m-timeline-3__items">
                                    @foreach($operations as $operation)

                                        <a href="{{route("leads.show",$operation->lead_id)}}"
                                           data-placement="top" title=""
                                           data-original-title="{{__('main.view')}}">


                                            <div class="m-timeline-3__item m-timeline-3__item--info"
                                                 id="removable{{$operation->id}}">
										<span class="m-timeline-3__item-time m--font-focus">
											<small>
												{{optional($operation->connection_way)->name}}
											</small>
										</span>
                                                <br>
                                                <span class="m-timeline-3__item-time m--font-focus">
											<small>
												{{optional($operation->connection_way_status)->name}}
											</small>
										</span>

                                                <div class="m-timeline-3__item-desc">
											<span class="m-timeline-3__item-text">

												{{Carbon\Carbon::parse($operation->operation_date)->format('Y-m-d')}}
                                                {{Carbon\Carbon::parse($operation->operation_time)->format('h:i A')}}
												<br>
												{!! $operation->notes !!}
											</span>
                                                    <br>
                                                </div>

                                                <div class="measures_details">
        										    <span class="m-timeline-3__item-user-name">
        												<a href="#" class="m-link m-link--metal m-timeline-3__item-link">
        													{{optional($operation->lead)->title}}
        												</a>
        											</span>
                                                </div>
                                            </div>
                                        </a>
                                    @endforeach
                                </div>

                                    <div class="row">
                                        <div class="col-sm-12 col-md-5">
                                            <div class="dataTables_info" id="m_table_1_info" role="status" aria-live="polite">{{__('main.show')}}
                                                {{$operations->firstItem()}} {{__('main.to')}} {{$operations->lastItem()}} {{__('main.from')}} {{$operations->total()}}
                                                {{__('main.record')}}
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-7">
                                            <div class="dataTables_paginate paging_full_numbers" id="m_table_1_paginate">
                                                {{$operations->links()}}
                                            </div>
                                        </div>
                                    </div>



                            </div>
</div>
                            <!--End::Timeline 3 -->
                        </div>


                        <div class="tab-pane " id="m_user_profile_tab_3">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="table-responsive">
                                    <table
                                        class="table table-bordered dataTable table-hover table-checkable
                         table-striped m-table m-table--head-bg-success custom_table">
                                        <thead>
                                        <tr>
                                            <th>#</th>

                                            <th >
                                                {!!trans('main.title') !!}
                                            </th>
                                            <th>
                                                {!!trans('main.details') !!}
                                            </th>
                                            <th>
                                                {!!trans('main.employee') !!}
                                            </th>
                                            <th>
                                                {!!trans('main.client') !!}
                                            </th>
                                            <th>
                                                {!! trans('main.lead_status') !!}
                                            </th>
                                            <th>
                                                {{trans('main.actions')}}
                                            </th>

                                        </tr>
                                        </thead>
                                        <div id="load">
                                            <div class="lds-roller">
                                                <div></div>
                                                <div></div>
                                                <div></div>
                                                <div></div>
                                                <div></div>
                                                <div></div>
                                                <div></div>
                                                <div></div>
                                            </div>
                                        </div>
                                        <tbody class="date">
                                        @foreach($resource->leads() as $row)
                                            <tr class="table_tr" id="removable{{$row->id}}">
                                                <td>{!!$loop->iteration!!}</td>

                                                <td>{!!$row->title!!}</td>
                                                <td>{!!$row->details!!}</td>
                                                <td>{!!optional($row->employee)->name!!}</td>
                                                <td>{!!optional($row->client)->name!!}</td>
                                                <td>
                                                <span data-toggle="m-tooltip" data-placement="top" title="" data-original-title="{{trans('main.change_status')}}">
                                                        <button class="btn btn-brand  " id="changestatus{{$row->id}}" type="button"
                                                                onclick="showmodelchange({!! $row->lead_status_id !!},{!! $row->id !!})">
                                                        {!!optional($row->status)->name!!}
                                                        </button>
                                                </span>
                                                </td>
                                                <td>

                                                    <a href="{!!route('leads.show',$row->id)!!}" class="m-portlet__nav-link btn m-btn m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" data-toggle="m-tooltip"
                                                       data-placement="top" title=""
                                                       data-original-title="{{__('main.show')}}">
                                                        <i class="la la-eye"></i>
                                                    </a>

                                                    <a href="{!!route('leads.edit',$row->id)!!}" class="m-portlet__nav-link btn m-btn m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" data-toggle="m-tooltip"
                                                       data-placement="top" title=""
                                                       data-original-title="{{__('main.edit')}}">
                                                        <i class="la la-edit"></i>
                                                    </a>

                                                    <button
                                                        class="m-portlet__nav-link btn m-btn m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill destroy"
                                                        data-toggle="m-tooltip" data-placement="top" title=""
                                                        data-original-title="حذف"
                                                        data-route="{!!route('leads.destroy',$row->id)!!}"
                                                        data-token="">
                                                        <i class="la la-trash"></i>
                                                    </button>

                                                </td>

                                            </tr>
                                        @endforeach

                                        </tbody>
                                    </table>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">

        {!!
        Form::model($resource,['method'=>'PUT','route'=>['users.update_photo',Auth()->user()->id],'files'=>'true','class'=>'m-form
        m-form--fit m-form--label-align-right'])!!}
        <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">{!! trans('main.change_image') !!}</h5>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="form-control-label" for="imageInput"> {!! trans('main.image') !!} </label>


                        <div class="custom-file">
                            <input type="file" class="form-control m-input custom-file-input" name="image"
                                   id="imageInput">
                            <label class="custom-file-label" for="customFile">أختر الملف</label>
                        </div>

                    </div>
                </div>
                <div class="m-portlet__foot m-portlet__foot--fit">
                    <div class="m-form__actions m-form__actions--solid">
                        <button type="submit" class="btn btn-primary">{{trans('main.save')}}</button>
                        <button type="button" class="btn btn-default"
                                data-dismiss="modal">{{trans('main.cancel')}}</button>
                    </div>

                </div>
            </div>
            {!!Form::close()!!}
        </div>
    </div>

    <div class="modal fade" id="changestatuslead" role="dialog">
        <div class="modal-dialog small_modal_dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">{!! trans('main.lead_status') !!}</h4>

                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <div class="modal-body">
                    <div class="form-group m-form__group ">
                        <label>{!! trans('main.lead_status') !!} </label>

                        {!! Form::select('lead_status_id',App\Models\LeadStatus::get()->pluck('name','id'),null,['class'=>'form-control
                m-input   status select2','id'=>'lead_status_id','placeholder'=>trans('main.lead_status')])!!}
                    </div>
                </div>
                <input type="hidden" name="lead_id" value="" id="lead_id"/>
                <div class="modal-footer">
                    <div class="">
                        <button type="button" onclick="changestatus()"
                                class="btn btn-accent save_popup_btn">{{trans('main.save')}}</button>
                    </div>
                </div>
            </div>

        </div>
    </div>
@endsection

@section('scripts')
    <script>


        function showmodelchange(status, lead_id) {

            $("#lead_id").val(lead_id);
            $("#lead_status_id").val(status);
            $("#changestatuslead").modal();
            // alert(status);
        }

        function changestatus() {

            var lead_id = $("#lead_id").val();
            var lead_status_id = $("#lead_status_id").val();
            var route_url = "{!!url('leads/changestatus')!!}" + '/' + lead_id + '/' + lead_status_id
            $.ajax({
                url: route_url,
                type: 'get', // replaced from put
                success: function (response) {

                    $("#changestatus" + lead_id).text(response.data.status);
                    $("#changestatuslead").modal("hide");
                    if (response.status == 1) {
                        toastr['success'](response.message);
                    }
                }
            });

        }


    </script>
@endsection
