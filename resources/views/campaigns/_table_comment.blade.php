<div class="row">
    <div class="col-sm-12">
        <div class="table-responsive">
        <table class="table table-bordered dataTable table-hover table-checkable
                         table-striped m-table m-table--head-bg-success custom_table">
            <thead>
                <tr>
                    <th>#</th>
              
                    <th class="sorting
                    {{(isset($date['sorttype']) && $date['sortby']=='comment') ? 'sorting_'.$date['sorttype'] :''}}" data-sorting_type="{{(isset($date['sorttype']) && $date['sortby']=='comment') ? $date['sorttype'] :'asc'}}" 
                    data-column_name="comment" style="cursor: pointer">{!!
                        trans('main.comment') !!}<span id="comment_icon"></span></th>
              
                    <th>{{trans('main.actions')}}</th>
                    
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
                @foreach($resource->campaigncomments as $resource)
                <tr class="table_tr" id="removable{{$resource->id}}">
                    <td>{!!$loop->iteration!!}</td>
                  
                    <td>{!!$resource->comment!!}</td>
                   
                    <td>
                        
                        <a href="{!!route('campaigncomments.edit',$resource->id)!!}" class="m-portlet__nav-link btn m-btn 
                    m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" data-toggle="m-tooltip" data-placement="top" title="" data-original-title="{{__('main.edit')}}">
                            <i class="la la-edit"></i>
                        </a>
                    
                        <button class="m-portlet__nav-link btn m-btn m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill destroy" data-toggle="m-tooltip" data-placement="top" title="" data-original-title="حذف"
                            data-route="{!!route('campaigncomments.destroy',$resource->id)!!}" data-token="">
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

