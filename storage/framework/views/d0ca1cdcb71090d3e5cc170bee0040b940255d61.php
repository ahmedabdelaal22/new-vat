<div class="filter_section" style="display: none;">
    <?php echo Form::open(["route"=>$basicRoute.'.index','method'=>'GET',"id"=>"filterDataForm","class"=>"filterDataForm"]); ?>


    <div class="m-portlet__body">
        <div class="form-group m-form__group row">

            <div class="col-lg-4 col-md-3 col-sm-12 form_input">
                <div id="m_table_1_filter" class="dataTables_filter">
                    <label for="serach"><?php echo trans('main.search'); ?></label>
                    <input type="search" class="form-control form-control-sm  " placeholder="" id="serach"
                           name="search_query"
                           name="search_query"
                           aria-controls="m_table_1"
                           autocomplete="off">
                </div>
            </div>

            <div class="col-sm-6 col-md-4 form_input">
                <label for="category_id"><?php echo trans('main.category'); ?></label>
                <?php echo Form::select('category_id',[],null,['class'=>'select2 select2_ajax custom-select custom-select-sm form-control form-control-sm   ','autocomplete'=>'off','id'=>'category_id']); ?>

            </div>


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
<?php /**PATH /var/www/html/invoices/resources/views/items/_filter_inputs.blade.php ENDPATH**/ ?>