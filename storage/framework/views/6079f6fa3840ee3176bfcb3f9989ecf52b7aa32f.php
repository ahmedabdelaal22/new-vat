<div class="d-flex align-items-center m-portlet__head table_btn_respo">
    <div>
        <div class="m-portlet__head-caption">
            <div class="m-portlet__head-title">
                <h3 class="m-portlet__head-text">
                    <?php echo e(trans('main.'.$basicRoute)); ?>

                </h3>
            </div>
        </div>
    </div>
    <div class="d-flex btn_con">
        <a href="#" title="" class="show_filter base_btn">
            <i class="fa fa-search"></i>
            <span><?php echo e(trans('main.search')); ?></span>
        </a>
        <?php if((!str_contains($basicRoute,"reports/clients_leads") and (!str_contains($basicRoute,"leads_statuses"))) and (str_contains($basicRoute,"clients") || str_contains($basicRoute,"leads")
        ||  str_contains($basicRoute,"inventories") || str_contains($basicRoute,"item_categories")
        ||  str_contains($basicRoute,"items") || str_contains($basicRoute,"inventory_items")
        )): ?>
        <?php if(Auth()->user()->is_super_admin || Auth()->user()->can($basicRoute.' import')  ): ?>
        <a href="#" title="" class="upload_btn base_btn">
            <!-- <i class="fa fa-file-download"></i> -->
            <i class="fa fa-upload"></i>
            <span><?php echo e(trans('main.import')); ?></span>
        </a>
         <?php endif; ?>
        <?php endif; ?>
        
        <?php if(!str_contains($basicRoute,"report") and !str_contains($basicRoute,"inventory_items") and !str_contains($basicRoute,"campaigns") and !str_contains($basicRoute,"purchase_installments")
        and !str_contains($basicRoute,"sales_invoices_installments")
 and !str_contains($basicRoute,"logs")
        ): ?>
            <?php if(Auth()->user()->is_super_admin || Auth()->user()->can($basicRoute.' create')): ?>
 
        <?php if(!str_contains($basicRoute,"report")): ?>
            <?php if(Auth()->user()->is_super_admin ||  Auth()->user()->can($basicRoute.' create')): ?>
 
                <a href="<?php echo route($basicRoute.'.create'); ?>" class="base_btn add_color">
                    <i class="fa fa-plus"></i>
                    <span><?php echo e(trans('main.add')); ?></span>
                </a>
            <?php endif; ?>

        <?php endif; ?>

        <?php endif; ?>
        <?php endif; ?>

        <?php if(str_contains($basicRoute,"report")): ?>
        <?php if(Auth()->user()->is_super_admin || Auth()->user()->can(str_replace("_", " ", $basicRoute).' export excel')  ): ?>

            <a href="#"
                class="base_btn export_excel">

                <i class="la la-file-excel-o"></i>
                <span><?php echo e(trans("main.export_excel")); ?>

                </span>

            </a>
            <?php endif; ?>
            <?php if(Auth()->user()->is_super_admin || Auth()->user()->can(str_replace("_", " ", $basicRoute).' export pdf')  ): ?>
            <a href="#"
                class="base_btn export_pdf">

                <i class="la la-file-pdf-o"></i>
                <span><?php echo e(trans("main.export_pdf")); ?></span>

            </a>
            <?php endif; ?>

        <?php endif; ?>
    </div>

</div>

<?php /**PATH /var/www/html/invoices/resources/views/layouts/table_buttons.blade.php ENDPATH**/ ?>