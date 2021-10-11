<?php $__env->startSection('title'); ?> <?php echo e(trans('main.'.$basicRoute)); ?> <?php $__env->stopSection(); ?>
<?php $__env->startSection('header'); ?><?php $__env->stopSection(); ?>
<?php $__env->startSection('breadcrumb'); ?>
    <?php ($breadcrumbs=[trans('main.'.$basicRoute)=>route($basicRoute.'.index'),]); ?>
    <?php echo $__env->renderWhen(isset($breadcrumbs),'layouts._breadcrumb', ['breadcrumbs' =>$breadcrumbs ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path'])); ?>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('content'); ?>

    <div class="m-portlet m-portlet--mobile">
        <?php echo $__env->make("layouts.table_buttons", \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <div class="m-portlet__body ">
            <div id="m_table_1_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                <?php echo $__env->make($basicRoute.'._filter_inputs', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                <div class="data" id="table-data">
                    <?php echo $__env->make($basicRoute.'._table', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                </div>
            </div>
        </div>
    </div>

<?php $__env->stopSection(); ?>
<?php $__env->startSection('scripts'); ?>






<?php $__env->stopSection(); ?>


<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/html/invoices/resources/views/sales_order/index.blade.php ENDPATH**/ ?>