<div class="form-group">
        <div id="m_repeater_1">
            <div class="form-group  m-form__group" id="m_repeater_1">
                <label><?php echo e(trans('main.phones')); ?></label>
                <div data-repeater-list="contacts" class="">
                    <?php if(isset($resource->phones) && !empty($resource->phones) && $resource->phones()->get()->count() > 0 ): ?>
                    <?php $__currentLoopData = $resource->phones; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $phone): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <div class="d-flex">
                        <div>
                    <div data-repeater-item class="d-flex phones_section">
                        <div class="m-form__control">
                            <input type="text" name="phone"  class="form-control m-input" placeholder="<?php echo e(trans('main.phone')); ?>" value="<?php echo e($phone->phone); ?>" autocomplete="off">
                        </div>
                        <div class="m-form__control">
                            <input type="text" name="notes" class="form-control m-input" placeholder="<?php echo e(trans('main.notes')); ?>" value="<?php echo e($phone->notes); ?>" autocomplete="off">
                        </div>
                        <div data-repeater-delete="" class="btn-sm btn btn-danger m-btn m-btn--icon m-btn--pill">
                            <span>
                                <i class="la la-trash-o"></i>
                                <span><?php echo e(trans('main.delete')); ?></span>
                            </span>
                        </div>
                    </div>
                    </div>
                    <?php if($loop->iteration ==1 ): ?>
                        <div data-repeater-create="" class="base_btn">
                            <i class="fa fa-plus"></i>
                            <span>إضافة</span>
                        </div>
                    <?php endif; ?>
                    </div>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    <?php else: ?>
                    <div class="d-flex">
                        <div>
                            <div data-repeater-item class="d-flex phones_section">
                                <div class="m-form__control">
                                    <input type="text" name="phone"  class="form-control m-input" placeholder="<?php echo e(trans('main.phone')); ?>" autocomplete="off">
                                </div>
                                <div class="m-form__control">
                                    <input type="text" name="notes" class="form-control m-input" placeholder="<?php echo e(trans('main.notes')); ?>" autocomplete="off">
                                </div>
                                <div data-repeater-delete="" class="btn-sm btn btn-danger m-btn m-btn--icon m-btn--pill">
                                    <span>
                                        <i class="la la-trash-o"></i>
                                        <span><?php echo e(trans('main.delete')); ?></span>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div data-repeater-create="" class="base_btn">
                            <i class="fa fa-plus"></i>
                            <span>إضافة</span>
                        </div>
                    </div>
                    
                    <?php endif; ?>
                </div>
            </div>
        </div>
</div>  

<?php /**PATH /var/www/html/invoices/resources/views/clients/_phones.blade.php ENDPATH**/ ?>