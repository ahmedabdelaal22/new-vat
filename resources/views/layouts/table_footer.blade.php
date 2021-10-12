<div class="d-flex justify-content-between table_footer_respo">
    <div class="">
        <div class="dataTables_info" id="m_table_1_info" role="status" aria-live="polite">{{__('main.show')}}
            {{$resources->firstItem()}} {{__('main.to')}} {{$resources->lastItem()}} {{__('main.from')}} {{$resources->total()}}
            {{__('main.record')}}
        </div>
    </div>
    <div class="">
        <div class="dataTables_paginate paging_full_numbers" id="m_table_1_paginate">
            <!-- {{$resources->links()}} -->
            {{ $resources->onEachSide(1)->links() }}
        </div>
    </div>
    <div class="table_view_rows_respo">

        <div class="table_actions d-flex justify-content-between">
            <div class="dataTables_length">
                <div class="d-flex">
                    <label class="label_text">{{trans('main.show')}}</label>
                    <select name="limit"
                            class="custom-select custom-select-sm form-control form-control-sm "
                            id="limit">
                        <option value="10">10</option>
                        <option value="25">25</option>
                        <option value="50">50</option>
                        <option value="100">100</option>
                    </select>
                </div>
            </div>
        </div>
    </div>
</div>


