<?php $__env->startSection('title'); ?> <?php echo e(trans('main.'.$basicRoute)); ?><?php $__env->stopSection(); ?>
<?php $__env->startSection('header'); ?><?php $__env->stopSection(); ?>
<?php $__env->startSection('breadcrumb'); ?>
    <?php ($breadcrumbs=[trans('main.'.$basicRoute)=>route($basicRoute.'.index'),trans('main.add')=>route($basicRoute.'.create')]); ?>
    <?php echo $__env->renderWhen(isset($breadcrumbs),'layouts._breadcrumb', ['breadcrumbs' =>$breadcrumbs ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path'])); ?>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('content'); ?>

    <!--begin::Portlet-->
    <div class="m-portlet m-portlet--tab">
        <div class="m-portlet__head">
            <div class="m-portlet__head-caption">
                <div class="m-portlet__head-title">
                    <span class="m-portlet__head-icon m--hide">
                        <i class="la la-gear"></i>
                    </span>
                    <h3 class="m-portlet__head-text">
                        <?php echo e(trans('main.add')); ?>

                    </h3>
                </div>
            </div>
        </div>

        <!--begin::Form-->

        <?php echo Form::open(['method'=>'post','route'=>$basicRoute.'.store','files'=>'true','class'=>'m-form m-form--fit m-form--label-align-right m-form--group-seperator-dashed']); ?>


        <?php echo $__env->make($basicViewFolder.'._form', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>

        <div class="m-portlet__foot m-portlet__foot--fit">
            <div class="m-form__actions m-form__actions--solid">
                <button type="submit" class="btn btn-primary"><?php echo e(trans('main.save')); ?></button>
            </div>
        </div>

    <?php echo Form::close(); ?>

    <!--end::Form-->
    </div>

<?php $__env->stopSection(); ?>


<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/html/invoices/resources/views/sales_invoices/create.blade.php ENDPATH**/ ?>