<div class="m-portlet__body">
    <div class="form-group m-form__group row">

        <div class="col-lg-12">
            <label for="category_id"><?php echo trans('main.parent_category'); ?></label>
            <?php echo Form::select('category_id',App\Models\ItemCategory::get()->pluck('name','id'),null,['class'=>'form-control
            m-input select2','id'=>'cetegory_id','placeholder'=>trans('main.category')]); ?>

        </div>
    </div>

    <div class="form-group m-form__group row">
        <div class="col-lg-6">
            <label for="itemCode"><?php echo trans('main.itemCode'); ?></label>
            <?php echo Form::text('itemCode',null,['class'=>'form-control
            m-input','id'=>'itemCode','placeholder'=>trans('main.itemCode')]); ?>

        </div>
        <div class="col-lg-6">
            <label for="name_en"><?php echo trans('main.unitType'); ?></label>
            <?php echo Form::select('unitType',settingselect('unitType'),null,['class'=>'form-control
            m-input select2','id'=>'unitType','placeholder'=>trans('main.unitType')]); ?>

        </div>
    </div>
    <div class="form-group m-form__group row">
        <div class="col-lg-6">
            <label for="name_ar"><?php echo trans('main.name_ar'); ?></label>
            <?php echo Form::text('name_ar',null,['class'=>'form-control
            m-input','id'=>'name_ar','placeholder'=>trans('main.name_ar')]); ?>

        </div>
        <div class="col-lg-6">
            <label for="name_en"><?php echo trans('main.name_en'); ?></label>
            <?php echo Form::text('name_en',null,['class'=>'form-control
            m-input','id'=>'name_en','placeholder'=>trans('main.name_en')]); ?>

        </div>
    </div>

    <div class="form-group m-form__group row">

        <div class="col-lg-6">
            <label for="unit_price"><?php echo trans('main.unit_price'); ?></label>
            <?php echo Form::text('unit_price',null,['class'=>'form-control ','id'=>'unit_price','placeholder'=>trans('main.unit_price')]); ?>

        </div>


        <div class="col-lg-6">
            <label for="sale_price"><?php echo trans('main.sale_price'); ?></label>
            <?php echo Form::text('sale_price',null,['class'=>'form-control ','id'=>'sale_price','placeholder'=>trans('main.sale_price')]); ?>

        </div>


        <div class="col-lg-6">
            <label for="purchase_price"><?php echo trans('main.purchase_price'); ?></label>
            <?php echo Form::text('purchase_price',null,['class'=>'form-control ','id'=>'purchase_price','placeholder'=>trans('main.purchase_price')]); ?>

        </div>

    </div>

    <div class="form-group m-form__group row">
    <?php $__currentLoopData = App\Models\Variation::orderBy('sort','ASC')->get(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $variation): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
        <?php
        $itemVariation = $resource->item_variations()->where('variation_id',$variation->id)->first();
        $labelName = 'label_'.App()->getLocale();
        $labelValue = 'value_'.App()->getLocale();
        ?>
        <?php if($variation->type == 'textarea'): ?>
            <div class="<?php echo e($variation->cols); ?>">
                <label for="<?php echo e($variation->name.'_'.$variation->id); ?>"><?php echo $variation->$labelName; ?></label>
                <textarea  name="variations[<?php echo e($variation->id); ?>]" <?php echo e($variation->options); ?>><?php echo e(!empty($itemVariation) ? $itemVariation->$labelValue : $variation->$labelValue); ?></textarea>
            </div>
        <?php elseif($variation->type == 'checkbox' || $variation->type == 'radio'): ?>
            <div class="<?php echo e($variation->cols); ?>">
                <label for="<?php echo e($variation->name.'_'.$variation->id); ?>"><?php echo $variation->$labelName; ?></label>

                <input type="<?php echo e($variation->type); ?>" name="variations[<?php echo e($variation->id); ?>]" <?php echo $variation->options; ?>  id="<?php echo e($variation->name.'_'.$variation->id); ?>"
                <?php echo e((!empty($itemVariation) && $itemVariation->$labelValue == $variation->$labelValue ) ? "checked" : ""); ?>

                value="<?php echo e($variation->$labelValue); ?>">

            </div>
        <?php else: ?>
            <div class="<?php echo e($variation->cols); ?>">
                <label for="<?php echo e($variation->name.'_'.$variation->id); ?>"><?php echo $variation->$labelName; ?></label>
                <input type="<?php echo e($variation->type); ?>" name="variations[<?php echo e($variation->id); ?>]" <?php echo $variation->options; ?>  id="<?php echo e($variation->name.'_'.$variation->id); ?>" value="<?php echo e(!empty($itemVariation) ? $itemVariation->$labelValue : $variation->$labelValue); ?>">
            </div>

        <?php endif; ?>
    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
    </div>

    <div class="col-lg-12">
        <label for="name"><?php echo trans('main.taxes'); ?></label>
        <?php echo Form::select('item_taxes[]',itemtaxes(),$resource->taxes(),['class'=>'form-control
        m-input select2','multiple','id'=>'taxes']); ?>

    </div>


    <div class="col-lg-12">
        <label for="name"><?php echo trans('main.responsables'); ?></label>
        <?php echo Form::select('responsables[]',App\Models\User::
            where(function($q){
                     if(!Auth()->user()->is_super_admin){
                            $q->where("team_leader_id",Auth()->user()->id);
                            $q->orWhere("manager_id",Auth()->user()->id);
                            $q->orWhere("id",Auth()->user()->id);
                        }

            })
            ->get()->pluck('name','id'),$resource->responsables(),['class'=>'form-control
        m-input select2','multiple','id'=>'phones']); ?>

    </div>
    <div class="form-group m-form__group row">
        <div class="col-lg-12">
            <label for="notes"><?php echo trans('main.notes'); ?></label>
            <?php echo Form::textarea('notes',null,['class'=>'form-control
            m-input','id'=>'notes','placeholder'=>trans('main.notes'),'rows'=>3]); ?>

        </div>
    </div>



</div>
<?php /**PATH /var/www/html/invoices/resources/views/items/_form.blade.php ENDPATH**/ ?>