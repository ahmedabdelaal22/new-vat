<div class="row">

    <div class="col-sm-12">
        <div class="table-responsive">
            <table class="table table-bordered dataTable table-hover table-checkable
                         table-striped m-table m-table--head-bg-success custom_table">
                <thead>
                    <tr>
                        <th>#</th>
                        <!-- <th>
                  
                        <?php echo trans('main.publicUrl'); ?>

                    </th> -->

                        <th>
                            <?php echo trans('main.status'); ?>

                        </th>
                        <th>
                            <?php echo trans('main.uuid'); ?>

                        </th>
                        <th>
                            <?php echo trans('main.internalId'); ?>

                        </th>
                        <th>
                            <?php echo trans('main.typeName'); ?>

                        </th>

                        <th>
                            <?php echo trans('main.receiverId'); ?>

                        </th>

                        <th>
                            <?php echo trans('main.receiverName'); ?>

                        </th>

                        <th>
                            <?php echo trans('main.dateTimeIssued'); ?>

                        </th>
                        <th>
                            <?php echo trans('main.totalSales'); ?>

                        </th>
                        <th>
                            <?php echo trans('main.totalDiscount'); ?>

                        </th>
                        <th>
                            <?php echo trans('main.netAmount'); ?>

                        </th>
                        <th>
                            <?php echo trans('main.total'); ?>

                        </th>


                        <th><?php echo e(trans('main.actions')); ?></th>

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
                    <tr class="table_tr" id="removable<?php echo e($resource->internalId); ?>">
                        <td><?php echo $loop->iteration; ?></td>
                        <td><?php echo $resource->status; ?></td>
                        <!-- <td><?php echo $resource->publicUrl; ?></td> -->

                        <td><?php echo $resource->uuid; ?></td>
                        <td><?php echo $resource->internalId; ?></td>
                        <td><?php echo $resource->typeName; ?></td>


                        <td><?php echo $resource->receiverId; ?></td>
                        <td><?php echo $resource->receiverName; ?></td>
                        <td><?php echo $resource->dateTimeIssued; ?></td>
                        <td><?php echo $resource->totalSales; ?></td>






                        <td><?php echo $resource->totalDiscount; ?></td>
                        <td><?php echo $resource->netAmount; ?></td>
                        <td><?php echo $resource->total; ?></td>

                        <td>




                            <?php if(!empty(session('generatedAccessToken')) && !empty($resource->uuid) ): ?>

                            <a href="<?php echo route('sales_invoices.showinvoice',$resource->uuid); ?>" class="m-portlet__nav-link btn m-btn
                    m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" data-toggle="m-tooltip"
                                data-placement="top" title="" data-original-title="<?php echo e(__('main.viewsdkinvoice')); ?>">
                                <i class="fa fa-eye"></i>

                            </a>
                            <a href="<?php echo route('cancelinvoice',$resource->uuid); ?>" class="m-portlet__nav-link btn m-btn
                    m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" data-toggle="m-tooltip"
                                           data-placement="top" title="" data-original-title="<?php echo e(__('main.edit')); ?>">
                                            <i class="fa fa-edit"></i>
                             </a>
                            <?php endif; ?>


                        </td>

                    </tr>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                </tbody>
            </table>


            <nav>
                <ul class="pagination">
                    <?php if($metadata['page'] == 1 ): ?>
                    <li class="page-item disabled" aria-disabled="true" aria-label="« السابق">
                        <span class="page-link" aria-hidden="true">‹</span>
                    </li>
                    <?php else: ?>
                    <a class="page-link" href="<?php echo e(url('invoicesdk')); ?>?page=<?php echo e($metadata['page']-1); ?>" rel="prev" aria-label="« السابق">‹</a>
                  <?php endif; ?>
                  <?php for($i=1;$i < $metadata['totalPages']+1;$i++): ?>

                  <?php if($i == $metadata['page'] ): ?>
                  <li class="page-item active" aria-current="page"><span class="page-link"><?php echo e($i); ?></span></li>

                    <?php else: ?>
                    <li class="page-item"><a class="page-link" href="<?php echo e(url('invoicesdk')); ?>?page=<?php echo e($i); ?>"><?php echo e($i); ?></a></li>
                    <?php endif; ?>
                   <?php endfor; ?>
                    <?php if($metadata['totalPages']==$metadata['page'] ): ?>
                    <li class="page-item disabled" aria-disabled="true" aria-label="التالي »">
                    <span class="page-link" aria-hidden="true">›</span>
                </li>

                    <?php else: ?>
                    <li class="page-item">
                        <a class="page-link" href="<?php echo e(url('invoicesdk')); ?>?page=<?php echo e($metadata['page']+1); ?>" rel="next"
                            aria-label="التالي »">›</a>
                    </li>

                    <?php endif; ?>
               
                </ul>
            </nav>
        </div>
    </div>
</div>
<?php /**PATH /var/www/html/invoices/resources/views/einvoicingsdk/_table.blade.php ENDPATH**/ ?>