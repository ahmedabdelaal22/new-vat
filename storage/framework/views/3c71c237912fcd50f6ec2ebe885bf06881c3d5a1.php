<div class="row">

    <div class="col-sm-12">
        <div class="table-responsive">
            <table class="table table-bordered dataTable table-hover table-checkable
                         table-striped m-table m-table--head-bg-success custom_table">
                <thead>
                <tr>
                    <th>#</th>
                    <th>
                  
                        <?php echo trans('main.code'); ?>

                    </th>

                    <th>
                        <?php echo trans('main.client'); ?>

                    </th>
                    <th>
                        <?php echo trans('main.inventory'); ?>

                    </th>
                    <th>
                        <?php echo trans('main.final_total'); ?>

                    </th>

                    <th>
                        <?php echo trans('main.paid_amount'); ?>

                    </th>

                    <th>
                        <?php echo trans('main.remaining_amount'); ?>

                    </th>

                    <th>
                        <?php echo trans('main.date'); ?>

                    </th>
                    <?php if(Auth()->user()->is_super_admin ||
                     Auth()->user()->can('sales invoices'.' edit')||
                     Auth()->user()->can('sales invoices'.' destroy')||
                     Auth()->user()->can('sales invoices'.' approve')||
                     Auth()->user()->can('sales invoices'.' show')||
                     Auth()->user()->can('sales invoices'.' print')
                     ): ?>
                        <th><?php echo e(trans('main.actions')); ?></th>
                    <?php endif; ?>
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
                <?php $__currentLoopData = $resources; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $resource): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <tr class="table_tr" id="removable<?php echo e($resource->id); ?>">
                        <td><?php echo $loop->iteration; ?></td>
                        <td><?php echo $resource->code; ?></td>
                        <td><?php echo optional($resource->client)->name; ?></td>
                        <td><?php echo optional($resource->inventory)->name; ?></td>
                        <td><?php echo $resource->final_total; ?></td>
                        <td><?php echo $resource->paid_amount; ?></td>
                        <td><?php echo $resource->remaining_amount; ?></td>
                        <td><?php echo $resource->date; ?></td>
                        <?php if(Auth()->user()->is_super_admin ||
                         Auth()->user()->can('sales invoices'.' edit')||
                         Auth()->user()->can('sales invoices'.' destroy')||
                         Auth()->user()->can('sales invoices'.' approve')||
                         Auth()->user()->can('sales invoices'.' show')||
                         Auth()->user()->can('sales invoices'.' print')
                         ): ?>
                            <td>

                                <?php if(Auth()->user()->is_super_admin ||
                                 Auth()->user()->can('sales invoices'.' show')
                                 ): ?>
                                    <a href="<?php echo route($basicRoute.'.show',$resource->id); ?>" class="m-portlet__nav-link btn m-btn
                    m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" data-toggle="m-tooltip"
                                       data-placement="top" title="" data-original-title="<?php echo e(__('main.show')); ?>">
                                        <i class="fa fa-eye"></i>
                                    </a>
                                <?php endif; ?>

                               <?php if(!empty(session('generatedAccessToken'))): ?>
                                <a href="<?php echo route($basicRoute.'.sdkinvoice',$resource->id); ?>" class="m-portlet__nav-link btn m-btn
                    m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" data-toggle="m-tooltip"
                                           data-placement="top" title="" data-original-title="<?php echo e(__('main.sdkinvoice')); ?>">
                                            <i class="fa fa-file-invoice"></i>
                                        
                            </a>

                            <?php endif; ?>


                            <?php if(!empty(session('generatedAccessToken')) && !empty($resource->uuid) ): ?>
                            
                                <a href="<?php echo route($basicRoute.'.showinvoice',$resource->uuid); ?>" class="m-portlet__nav-link btn m-btn
                    m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" data-toggle="m-tooltip"
                                           data-placement="top" title="" data-original-title="<?php echo e(__('main.viewsdkinvoice')); ?>">
                                            <i class="fa fa-eye"></i>
                                        
                            </a>

                            <?php endif; ?>

                                <?php if($resource->status == 'new'): ?>
                                    <?php if(Auth()->user()->is_super_admin ||
                                 Auth()->user()->can('sales invoices'.' approve')
                                 ): ?>
                                        <a href="<?php echo route($basicRoute.'.approve',$resource->id); ?>" class="m-portlet__nav-link btn m-btn
                    m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" data-toggle="m-tooltip"
                                           data-placement="top" title="" data-original-title="<?php echo e(__('main.approve')); ?>">
                                            <i class="fa fa-check"></i>
                                        </a>
                                    <?php endif; ?>
                                    <?php if(Auth()->user()->is_super_admin ||
                                 Auth()->user()->can('sales invoices'.' edit')
                                 ): ?>
                                        <a href="<?php echo route($basicRoute.'.edit',$resource->id); ?>" class="m-portlet__nav-link btn m-btn
                    m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" data-toggle="m-tooltip"
                                           data-placement="top" title="" data-original-title="<?php echo e(__('main.edit')); ?>">
                                            <i class="fa fa-edit"></i>
                                        </a>
                                    <?php endif; ?>
                                    <?php if(Auth()->user()->is_super_admin ||
                                 Auth()->user()->can('sales invoices'.' destroy')
                                 ): ?>
                                        <button
                                            class="m-portlet__nav-link btn m-btn m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill destroy delete_icon"
                                            data-toggle="m-tooltip" data-placement="top" title=""
                                            data-original-title="<?php echo e(__('main.delete')); ?>"
                                            data-route="<?php echo route($basicRoute.'.destroy',$resource->id); ?>"
                                            data-token="">
                                            <i class="fa fa-trash"></i>
                                        </button>
                                    <?php endif; ?>
                                <?php else: ?>
                                    <?php if(Auth()->user()->is_super_admin ||
                                 Auth()->user()->can('sales invoices'.' print')
                                 ): ?>
                                        <a href="<?php echo route($basicRoute.'.print',$resource->id); ?>" class="m-portlet__nav-link btn m-btn
                                m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" data-toggle="m-tooltip"
                                           data-placement="top" title="" data-original-title="<?php echo e(__('main.print')); ?>"
                                           target="_blank">
                                            <i class="fa fa-print"></i>
                                        </a>
                                    <?php endif; ?>
                                <?php endif; ?>
                            </td>
                        <?php endif; ?>
                    </tr>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                </tbody>
            </table>
        </div>
    </div>
</div>
<?php if(count($resources)): ?>
    <?php echo $__env->make("layouts.table_footer", \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<?php endif; ?>
<?php /**PATH /var/www/html/invoices/resources/views/sales_invoices/_table.blade.php ENDPATH**/ ?>