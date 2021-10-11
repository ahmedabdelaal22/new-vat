<div class="m-portlet__body">
    <div class="form-group m-form__group row">
            <?php $__currentLoopData = $resources; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $resource): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <div class="form-group m-form__group col-lg-4">
                    <?php if($resource->option_type == 'textarea'): ?>
                        <label for="code"><?php echo trans('main.'.$resource->name); ?></label>
                        <textarea name="<?php echo e($resource->name.'['.$resource->id.']'); ?>" class="form-control <?php echo e($resource->option); ?>"><?php echo e($resource->value); ?></textarea>
                    <?php elseif($resource->option_type == 'checkbox' || $resource->option_type == 'radio'): ?>
                        <div class="checkbox primary">
                            <input type="<?php echo e($resource->option_type); ?>" name="<?php echo e($resource->name.'['.$resource->id.']'); ?>" <?php echo e(($resource->value) ? 'checked' : ''); ?> class="form-control <?php echo e($resource->option); ?>" value="<?php echo e($resource->value); ?>" id="<?php echo e($resource->name.$resource->id); ?>">
                            <label for="<?php echo e($resource->name.$resource->id); ?>"><?php echo trans('main.'.$resource->name); ?></label>
                        </div>
                        <?php elseif($resource->option_type == 'select' ): ?>
                        <div class="select primary">
                        <label for="<?php echo e($resource->name.$resource->id); ?>"><?php echo trans('main.'.$resource->name); ?></label>
                        <?php echo Form::select("$resource->name[$resource->id]",settingselect($resource->name),$resource->value,['class'=>'form-control
                           m-input select2','autocomplete'=>'off','id'=>'parent_category']); ?>

              
                        </div>
                    <?php else: ?>
                        <label for="code"><?php echo trans('main.'.$resource->name); ?></label>
                        <input type="<?php echo e($resource->option_type); ?>" name="<?php echo e($resource->name.'['.$resource->id.']'); ?>" class="form-control <?php echo e($resource->option); ?>" value="<?php echo e($resource->value); ?>">
                    <?php endif; ?>
                    
                </div>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
    </div>
</div>
<?php $__env->startSection('scripts'); ?>
<script type="text/javascript">


</script>
<?php $__env->stopSection(); ?>
<?php /**PATH /var/www/html/invoices/resources/views/settings/_form.blade.php ENDPATH**/ ?>