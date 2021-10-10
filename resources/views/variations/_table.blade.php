<div class="row">
    <div class="col-sm-12">
        <div class="table-responsive">
        <table class="table table-bordered dataTable table-hover table-checkable
                         table-striped m-table m-table--head-bg-success custom_table">
            <thead>
                <tr>
                    <th>#</th>
                    <th>
                        {!!trans('main.show') !!}
                        <!-- <span id="email_icon"></span> -->
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
                @foreach($resources as $resource)
                <tr class="table_tr" id="removable{{$resource->id}}">
                    <td>{!!$loop->iteration!!}</td>

                    <td>
                        <span class="m-switch m-switch--success">
                            <label>
                                <input type="checkbox" checked="checked" name="">
                                <span></span>
                            </label>
                        </span>
                        <div class="form-group">
                            <label for="{!! $resource->name.'_'.$resource->id !!}">
                                {!! $resource->label !!}
                            </label>
                            <input type="{!! $resource->type !!}" name="{!! $resource->name !!}" {!! $resource->options !!}>
                        </div>

                    </td>

                </tr>
                @endforeach

            </tbody>
        </table>
        </div>
    </div>
</div>
@if(count($resources))
    @include("layouts.table_footer")
@endif
