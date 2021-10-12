<div class="d-flex align-items-center m-portlet__head table_btn_respo">
    <div>
        <div class="m-portlet__head-caption">
            <div class="m-portlet__head-title">
                <h3 class="m-portlet__head-text">
                    {{trans('main.'.$basicRoute)}}
                </h3>
            </div>
        </div>
    </div>
    <div class="d-flex btn_con">
        <a href="#" title="" class="show_filter base_btn">
            <i class="fa fa-search"></i>
            <span>{{trans('main.search')}}</span>
        </a>
        @if((!str_contains($basicRoute,"reports/clients_leads") and (!str_contains($basicRoute,"leads_statuses"))) and (str_contains($basicRoute,"clients") || str_contains($basicRoute,"leads")
        ||  str_contains($basicRoute,"inventories") || str_contains($basicRoute,"item_categories")
        ||  str_contains($basicRoute,"items") || str_contains($basicRoute,"inventory_items")
        ))
        @if(Auth()->user()->is_super_admin || Auth()->user()->can($basicRoute.' import')  )
        <a href="#" title="" class="upload_btn base_btn">
            <!-- <i class="fa fa-file-download"></i> -->
            <i class="fa fa-upload"></i>
            <span>{{trans('main.import')}}</span>
        </a>
         @endif
        @endif
        
        @if(!str_contains($basicRoute,"report") and !str_contains($basicRoute,"inventory_items") and !str_contains($basicRoute,"campaigns") and !str_contains($basicRoute,"purchase_installments")
        and !str_contains($basicRoute,"sales_invoices_installments")
 and !str_contains($basicRoute,"logs")
        )
            @if(Auth()->user()->is_super_admin || Auth()->user()->can($basicRoute.' create'))
 
        @if(!str_contains($basicRoute,"report"))
            @if(Auth()->user()->is_super_admin ||  Auth()->user()->can($basicRoute.' create'))
 
                <a href="{!!route($basicRoute.'.create')!!}" class="base_btn add_color">
                    <i class="fa fa-plus"></i>
                    <span>{{trans('main.add')}}</span>
                </a>
            @endif

        @endif

        @endif
        @endif

        @if(str_contains($basicRoute,"report"))
        @if(Auth()->user()->is_super_admin || Auth()->user()->can(str_replace("_", " ", $basicRoute).' export excel')  )

            <a href="#"
                class="base_btn export_excel">

                <i class="la la-file-excel-o"></i>
                <span>{{trans("main.export_excel")}}
                </span>

            </a>
            @endif
            @if(Auth()->user()->is_super_admin || Auth()->user()->can(str_replace("_", " ", $basicRoute).' export pdf')  )
            <a href="#"
                class="base_btn export_pdf">

                <i class="la la-file-pdf-o"></i>
                <span>{{trans("main.export_pdf")}}</span>

            </a>
            @endif

        @endif
    </div>

</div>

