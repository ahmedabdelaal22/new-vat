<div class="row">

    <div class="col-sm-12">
        <div class="table-responsive">
        <table class="table table-bordered dataTable table-hover table-checkable
                         table-striped m-table m-table--head-bg-success custom_table">
            <thead>
            <tr>
                <th>#</th>
                <th class="sorting
                     {{(isset($date['sorttype']) && $date['sortby']=='name') ? 'sorting_'.$date['sorttype'] :''}}"
                    data-sorting_type="{{(isset($date['sorttype']) && $date['sortby']=='name') ? $date['sorttype'] :'asc'}}"
                    data-column_name="name" style="cursor: pointer">
                    {{trans("main.user")}}<span id="name_icon"></span></th>
                <th>{{trans("main.action")}}</th>
                <th>{{trans("main.details_in_link")}}</th>
                <th class="sorting
                    {{(isset($date['sorttype']) && $date['sortby']=='description') ? 'sorting_'.$date['sorttype'] :''}}
                    "
                    data-sorting_type="{{(isset($date['sorttype']) && $date['sortby']=='description') ? $date['sorttype'] :'asc'}}"
                    data-sorting_type="asc" data-column_name="description" style="cursor: pointer">
                    {{trans("main.date")}}<span id="description_icon"></span></th>

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
            @foreach($resources as $resource)

                    <tr class="table_tr" id="removable{{$resource->id}}">
                        <td>{!!$loop->iteration!!}</td>
                        <td>{!! \App\Models\User::where("id",$resource->user_id)->first()->name !!}</td>
                        <td>{{showLoghelper($resource->auditable_type,$resource->event)}}</td>
                        <td>

                            @if(Auth()->user()->is_super_admin )
                            @if(showGetUrlHelper($resource->url, $resource->auditable_type, $resource->auditable_id))
                                <a href="{{showGetUrlHelper($resource->url, $resource->auditable_type, $resource->auditable_id)}}"
                                   target="_blank" class="m-portlet__nav-link btn m-btn
                    m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill">
                                    <i class="fa fa-link"></i>
                                </a>
                            @endif
                            @endif

                            <a
                                target="_blank" class="m-portlet__nav-link btn m-btn
                    m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill"
                                class="btn btn-primary" data-toggle="modal" data-target="#m_modal_6_{{$resource->id}}">
                                <i class="fa fa-eye"></i>
                            </a>

                            <a
                                target="_blank" class="m-portlet__nav-link btn m-btn
                    m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill"
                                class="btn btn-primary" data-toggle="modal" data-target="#m_modal_1_{{$resource->id}}">
                                <i class="fa fa-history"></i>
                            </a>


                        </td>
                        <td>{!!$resource->created_at!!}</td>

                    </tr>

            @endforeach
            @include('empty.index')

            </tbody>
        </table>
        </div>
    </div>
</div>

@if(count($resources))
@foreach($resources as $resource)
@include('logs.logs_modal')
@include('logs.logs_new_old_modal')
@endforeach
@endif
@if(count($resources))
    @include("layouts.table_footer")
@endif
