<div class="row">

    <div class="col-sm-12">
        <div class="table-responsive">
        <table class="table table-bordered dataTable table-hover table-checkable
                         table-striped m-table m-table--head-bg-success custom_table">
            <thead>
                <tr>
                    <th>#</th>

                    <th class="sorting
                    <?php echo e((isset(request()->sortby) && request()->sortby=='name') ? 'sorting_'.request()->sorttype :''); ?>" data-sorting_type="<?php echo e((isset(request()->sorttype) && request()->sortby=='name') ? request()->sorttype :'asc'); ?>"
                    data-column_name="name" style="cursor: pointer"><?php echo trans('main.name'); ?><span id="name_icon"></span></th>
                    <th class="sorting
                    <?php echo e((isset(request()->sorttype) && request()->sortby=='email') ? 'sorting_'.request()->sorttype :''); ?>" data-sorting_type="<?php echo e((isset(request()->sorttype) && request()->sortby=='email') ? request()->sorttype :'asc'); ?>"
                    data-column_name="email" style="cursor: pointer"><?php echo trans('main.email'); ?>

                        <span id="email_icon"></span>
                    </th>
                    <?php if(Auth()->user()->is_super_admin ||
                     Auth()->user()->can($basicRoute.' edit')||
                     Auth()->user()->can($basicRoute.' destroy')||
                     Auth()->user()->can($basicRoute.' show')
                     ): ?>
                    <th class="client_actions"><?php echo e(trans('main.actions')); ?></th>
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

                    <td><?php echo $resource->name; ?></td>
                    <td><?php echo $resource->email; ?></td>
                    <?php if(Auth()->user()->is_super_admin ||
                     Auth()->user()->can($basicRoute.' edit')||
                     Auth()->user()->can($basicRoute.' destroy')||
                     Auth()->user()->can($basicRoute.' show')
                     ): ?>
                    <td>

                    <?php if(Auth()->user()->is_super_admin ||
                     Auth()->user()->can($basicRoute.' show')
                     ): ?>
                        <a href="<?php echo route($basicRoute.'.show',$resource->id); ?>" class="m-portlet__nav-link btn m-btn
                    m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" data-toggle="m-tooltip" data-placement="top" title="" data-original-title="<?php echo e(__('main.show')); ?>">
                            <i class="fa fa-eye"></i>
                        </a>
                        <?php endif; ?>
                        <?php if(Auth()->user()->is_super_admin ||
                     Auth()->user()->can($basicRoute.' edit')
                     ): ?>
                        <a href="<?php echo route($basicRoute.'.edit',$resource->id); ?>" class="m-portlet__nav-link btn m-btn
                    m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" data-toggle="m-tooltip" data-placement="top" title="" data-original-title="<?php echo e(__('main.edit')); ?>">
                            <i class="fa fa-edit"></i>
                        </a>
                       <?php endif; ?>
                       <?php if(Auth()->user()->is_super_admin ||
                     Auth()->user()->can($basicRoute.' destroy')
                     ): ?>
                        <button class="m-portlet__nav-link btn m-btn m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill destroy delete_icon" data-toggle="m-tooltip" data-placement="top" title="" data-original-title="حذف"
                            data-route="<?php echo route($basicRoute.'.destroy',$resource->id); ?>" data-token="">
                            <i class="fa fa-trash"></i>
                        </button>
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
<?php /**PATH /var/www/html/invoices/resources/views/clients/_table.blade.php ENDPATH**/ ?>