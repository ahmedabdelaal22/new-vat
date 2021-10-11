<?php $__env->startSection('title'); ?> <?php echo e(trans('main.'.$basicRoute)); ?> <?php $__env->stopSection(); ?>
<?php $__env->startSection('header'); ?><?php $__env->stopSection(); ?>
<?php $__env->startSection('breadcrumb'); ?>
    <?php ($breadcrumbs=[trans('main.'.$basicRoute)=>route($basicRoute.'.index'),]); ?>
    <?php echo $__env->renderWhen(isset($breadcrumbs),'layouts._breadcrumb', ['breadcrumbs' =>$breadcrumbs ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path'])); ?>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('content'); ?>

    <div class="m-portlet m-portlet--mobile">
        <div class="m-portlet__head">
            <div class="m-portlet__head-caption">
                <div class="m-portlet__head-title">
                    <h3 class="m-portlet__head-text">
                        <?php echo e(trans('main.'.$basicRoute)); ?>

                    </h3>
                </div>
            </div>

            <div class="m-portlet__head-tools">
                <ul class="m-portlet__nav">

                    <?php if($data->validationResults->status == 'Invalid'): ?>

                        <li class="m-portlet__nav-item">
                            <a href="<?php echo route($basicRoute.'.edit',$data->internalId); ?>" class="m-portlet__nav-link btn m-btn
                    m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" data-toggle="m-tooltip"
                               data-placement="top" title="" data-original-title="<?php echo e(__('main.edit')); ?>">
                                <i class="la la-edit"></i>
                            </a>
                        </li>
     
                    <?php else: ?>
                        <li class="m-portlet__nav-item">
                            <a href="<?php echo route($basicRoute.'.print',$data->internalId); ?>" class="m-portlet__nav-link btn m-btn
                        m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" data-toggle="m-tooltip"
                               data-placement="top" title="" data-original-title="<?php echo e(__('main.print')); ?>" target="_blank">
                                <i class="la la-print"></i>
                            </a>
                        </li>
                    <?php endif; ?>
                    <li class="m-portlet__nav-item"></li>

                </ul>
            </div>

        </div>
        <div class="m-portlet__body ">
            <div class="row">
           
            <div class="col-md-6 form-group">
                    <label><?php echo e(__('main.status')); ?> : </label>
                    <label><?php echo e($data->validationResults->status); ?></label>
                </div>
                <div class="col-md-6 form-group">
                    <label><?php echo e(__('main.typeName')); ?> : </label>
                    <label><?php echo e($data->typeName); ?></label>
                </div>

                <div class="col-md-6 form-group">
                    <label><?php echo e(__('main.dateTimeIssued')); ?> : </label>
                    <label><?php echo e($data->dateTimeIssued); ?></label>
                </div>

                <div class="col-md-6 form-group">
                    <label><?php echo e(__('main.totalSales')); ?> : </label>
                    <label><?php echo e($data->totalSales); ?></label>
                </div>
                <div class="col-md-6 form-group">
                    <label><?php echo e(__('main.totalDiscount')); ?> : </label>
                    <label><?php echo e($data->totalDiscount); ?></label>
                </div>
                <div class="col-md-6 form-group">
                    <label><?php echo e(__('main.netAmount')); ?> : </label>
                    <label><?php echo e($data->netAmount); ?></label>
                </div>

                <div class="col-md-6 form-group">
                    <label><?php echo e(__('main.total')); ?> : </label>
                    <label><?php echo e($data->total); ?></label>
                </div>
                <div class="col-md-6 form-group">
                    <label><?php echo e(__('main.receiverId')); ?> : </label>
                    <label><?php echo e($data->receiverId); ?></label>
                </div>

                <div class="col-md-6 form-group">
                    <label><?php echo e(__('main.receiverName')); ?> : </label>
                    <label><?php echo e($data->receiverName); ?></label>
                </div>


                <div class="col-md-12 form-group">

                    <table class="table table-striped- table-bordered dataTable table-hover table-checkable"
                           id="InvoiceTableData">
                        <thead>
                        <th style="width: 150px!important">
                            <?php echo e(__('main.description')); ?>

                        </th>
                        <th style="width: 111px!important">
                            <?php echo e(__('main.itemType')); ?>

                        </th>
                        <th style="width: 111px!important">
                            <?php echo e(__('main.itemCode')); ?>

                        </th>

                        <th style="width: 111px!important">
                            <?php echo e(__('main.unitType')); ?>

                        </th>
                        <th style="width: 111px!important">
                            <?php echo e(__('main.salesTotal')); ?>

                        </th>
                        <th style="width: 111px!important">
                            <?php echo e(__('main.totalTaxableFees')); ?>

                        </th>
                        <th style="width: 111px!important">
                            <?php echo e(__('main.discount')); ?>

                        </th>
                        <th style="width: 111px!important">
                            <?php echo e(__('main.netTotal')); ?>

                        </th>

                        <th style="width: 111px!important">
                            <?php echo e(__('main.total')); ?>

                        </th>
                        </thead>

                        
                        <tbody>
                        <?php if($data->document): ?>
                        <?php 
                       $invoiceLines= json_decode($data->document)->invoiceLines;
                        ?>
                            <?php $__currentLoopData = $invoiceLines; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <tr>
                                    <td><?php echo e($item->description); ?></td>
                                    <td><?php echo e($item->itemType); ?></td>
                                    <td><?php echo e($item->itemCode); ?></td>
                                    <td><?php echo e($item->unitType); ?></td>
                                    <td><?php echo e($item->salesTotal); ?></td>
                                     <td><?php echo e($item->totalTaxableFees); ?></td>
                                    <td><?php echo e($item->discount->amount); ?></td>
                                    <td><?php echo e($item->netTotal); ?></td>
                                    <td><?php echo e($item->total); ?></td>
                            
                          
                                </tr>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        <?php endif; ?>
                        </tbody>

                    </table>

                </div>

             

                <div class="col-md-12 form-group">
                    <label><?php echo e(__('main.taxes')); ?></label>
                    <table class="table table-striped- table-bordered dataTable table-hover table-checkable"
                           id="InvoiceInstallmentTableData">
                        <thead>
                        <th>
                            <?php echo e(__('main.taxType')); ?>

                        </th>

                        <th>
                            <?php echo e(__('main.amount')); ?>

                        </th>



                        </thead>
                        <tbody>
                            <?php 
                            $taxTotals= json_decode($data->document)->taxTotals;
                            ?>
                        <?php if($taxTotals): ?>
                            <?php $__currentLoopData = $taxTotals; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $tax): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <tr>
                                    <td>
                                   <?php echo e($tax->taxType); ?>

                                    </td>
                                    <td>
                                    <?php echo e($tax->amount); ?>

                                    </td>
                                
                                </tr>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        <?php endif; ?>
              
                        </tbody>

                    </table>
                </div>


                <div class="col-md-12 form-group">
                    <label><?php echo e(__('main.validationSteps')); ?></label>
                    <table class="table table-striped- table-bordered dataTable table-hover table-checkable"
                           id="InvoiceInstallmentTableData">
                        <thead>
                        <th>
                            <?php echo e(__('main.name')); ?>

                        </th>

                        <th>
                            <?php echo e(__('main.status')); ?>

                        </th>



                        </thead>
                        <tbody>
                            <?php 
                            $validationSteps=$data->validationResults->validationSteps;
                            ?>
                        <?php if($validationSteps): ?>
                            <?php $__currentLoopData = $validationSteps; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $step): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <tr>
                                    <td>
                                   <?php echo e($step->name); ?>

                                    </td>
                                    <td>
                                    <?php echo e($step->status); ?>

                                    <?php if($step->status == 'Invalid'): ?>
                                    <?php $__currentLoopData = $step->error->innerError; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $er): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <tr>
                                    <td>  <?php echo e($er->propertyPath); ?></td>
                                    <td>  <?php echo e($er->errorCode); ?></td>
                                    <td>  <?php echo e($er->error); ?></td>
                                     </tr>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                    <?php endif; ?>
                                    </td>
                                
                                </tr>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        <?php endif; ?>
              
                        </tbody>

                    </table>
                </div>
            </div>
        </div>
    </div>

<?php $__env->stopSection(); ?>
<?php $__env->startSection('scripts'); ?>
    <script type="text/javascript">

    </script>

<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/html/invoices/resources/views/sales_invoices/showinvoice.blade.php ENDPATH**/ ?>