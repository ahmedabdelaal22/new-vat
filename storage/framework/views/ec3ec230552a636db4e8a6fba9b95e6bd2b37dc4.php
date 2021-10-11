<div class="filter_section" style="display: none;">
    <?php echo Form::open(["route"=>$basicRoute.'.index','method'=>'GET',"id"=>"filterDataForm","class"=>"filterDataForm"]); ?>


    <div class="m-portlet__body">
    <div class="form-group m-form__group row">

        <div class="col-lg-4 col-md-3 col-sm-12 form_input">
            <div id="m_table_1_filter" class="dataTables_filter">
                <label for="serach"><?php echo trans('main.search'); ?></label>
                <input type="search" class="form-control form-control-sm  " placeholder="" id="serach" name="search_query"
                       name="search_query"
                       aria-controls="m_table_1">
            </div>
        </div>
        <div class="col-lg-4 col-md-3 col-sm-12 form_input">
            <label for="date"><?php echo trans('main.date'); ?></label>
            <div class="input-daterange input-group">
                <input type="text" class="form-control form-control-sm date-picker" name="date_start">
                <div class="input-group-append">
                    <span class="span_to"><?php echo e(trans('main.to')); ?></span>
                </div>
                <input type="text" class="form-control form-control-sm date-picker" name="date_end">
            </div>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-12 form_input">
            <label for="final_total"><?php echo trans('main.final_total'); ?></label>

            <div class="input-daterange input-group">
                <input class="form-control form-control-sm" type="number" name="final_total_start">
                <div class="input-group-append">
                    <span class="span_to"><?php echo e(trans('main.to')); ?></span>
                </div>
                <input class="form-control form-control-sm" type="number" name="final_total_end">
            </div>
        </div>



        

        <div class="col-sm-6 col-md-4 form_input">
            <label for="client_id"><?php echo trans('main.client'); ?></label>
            <?php echo Form::select('client_id',[],null,['class'=>'select2 select2_ajax custom-select custom-select-sm form-control form-control-sm   ','id'=>'client_id']); ?>

        </div>


        <div class="col-sm-6 col-md-4 form_input">
            <label for="inventory_id"><?php echo trans('main.inventory'); ?></label>
            <?php echo Form::select('inventory_id',[],null,['class'=>'select2 select2_ajax custom-select custom-select-sm form-control form-control-sm   ','id'=>'inventory_id']); ?>

        </div>
        <!-- <div class="col-sm-6 col-md-4 form_input"></div> -->
        <!-- <div class="col-sm-6 col-md-4 form_input"></div> -->
        <div class="col-sm-6 col-md-4 form_input d-flex justify-content-end">
            <a href="#" title="" id="clear" class="clear_btn base_btn">
                <i class="la la-trash"></i>
                <span><?php echo e(trans('main.clear')); ?></span>
            </a>
        </div>
    </div>
</div>
<?php echo Form::close(); ?>

</div>
<?php /**PATH /var/www/html/invoices/resources/views/sales_order/_filter_inputs.blade.php ENDPATH**/ ?>