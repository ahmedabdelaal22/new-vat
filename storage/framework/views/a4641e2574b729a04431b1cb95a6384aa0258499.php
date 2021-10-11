<div class="m-portlet__body">
    <div class="form-group m-form__group row add_form">
        <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
            <label for="name"><?php echo trans('main.name'); ?></label>
            <?php echo Form::text('name',null,['class'=>'form-control
            m-input','id'=>'name','placeholder'=>trans('main.name')]); ?>

        </div>
        <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
            <label for="email"><?php echo trans('main.email'); ?></label>
            <?php echo Form::text('email',null,['class'=>'form-control
            m-input','id'=>'email','placeholder'=>trans('main.email')]); ?>

        </div>
        <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
            <label for="exampleInputName"><?php echo e(trans('main.category')); ?></label>
            <?php echo Form::select('category_id',App\Models\ClientCategory::get()->pluck('name','id'),null,['class'=>'form-control
            m-input m-select2 select2','id'=>'category_id','style'=>'width:100%','placeholder'=>trans('main.category')]); ?>


        </div>
  
        <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
            <label for="exampleInputName"><?php echo e(trans('main.birth_date')); ?></label>
            <?php echo Form::text('birth_date',null,['class'=>'form-control
            m-input date-picker','autocomplete'=>"off",'placeholder'=>trans('main.birth_date')]); ?>

        </div>
        <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
            <label for="exampleInputName"><?php echo trans('main.job'); ?></label>
            <?php echo Form::text('job',null,['class'=>'form-control
            m-input','id'=>'job','placeholder'=>trans('main.job')]); ?>

        </div>
        <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
            <label for="exampleInputName"><?php echo e(trans('main.address')); ?></label>
            <?php echo Form::text('address',null,['class'=>'form-control
            m-input','id'=>'address','placeholder'=>trans('main.address')]); ?>

        </div>


        <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
            <label for="exampleInputName"><?php echo e(trans('main.receiver_id')); ?></label>
            <?php echo Form::text('receiver_id',null,['class'=>'form-control
            m-input ','placeholder'=>trans('main.receiver_id')]); ?>

        </div>
        <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
            <label for="exampleInputName"><?php echo trans('main.receiver_type'); ?></label>
            <?php echo Form::text('receiver_type',null,['class'=>'form-control
            m-input','id'=>'receiver_type','placeholder'=>trans('main.receiver_type')]); ?>

        </div>
        <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
            <label for="exampleInputName"><?php echo e(trans('main.address_country')); ?></label>
            <?php echo Form::select("address_country",settingselect('address_country'),$resource->address_country,['class'=>'form-control
                           m-input select2','autocomplete'=>'off','id'=>'parent_category']); ?>

        </div>

        <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
            <label for="exampleInputName"><?php echo e(trans('main.address_governate')); ?></label>
            <?php echo Form::text('address_governate',null,['class'=>'form-control
            m-input ','placeholder'=>trans('main.address_governate')]); ?>

        </div>
        <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
            <label for="exampleInputName"><?php echo trans('main.address_regionCity'); ?></label>
            <?php echo Form::text('address_regionCity',null,['class'=>'form-control
            m-input','id'=>'address_regionCity','placeholder'=>trans('main.address_regionCity')]); ?>

        </div>
        <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
            <label for="exampleInputName"><?php echo trans('main.address_street'); ?></label>
            <?php echo Form::text('address_street',null,['class'=>'form-control
            m-input','id'=>'address_street','placeholder'=>trans('main.address_street')]); ?>

        </div>

        <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
            <label for="exampleInputName"><?php echo e(trans('main.address_buildingNumber')); ?></label>
            <?php echo Form::text('address_buildingNumber',null,['class'=>'form-control
            m-input ','placeholder'=>trans('main.address_buildingNumber')]); ?>

        </div>
        <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
            <label for="exampleInputName"><?php echo trans('main.address_postalCode'); ?></label>
            <?php echo Form::text('address_postalCode',null,['class'=>'form-control
            m-input','id'=>'address_postalCode','placeholder'=>trans('main.address_postalCode')]); ?>

        </div>
        <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
            <label for="exampleInputName"><?php echo trans('main.address_floor'); ?></label>
            <?php echo Form::text('address_floor',null,['class'=>'form-control
            m-input','id'=>'address_floor','placeholder'=>trans('main.address_floor')]); ?>

        </div>




        <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
            <label for="exampleInputName"><?php echo e(trans('main.address_room')); ?></label>
            <?php echo Form::text('address_room',null,['class'=>'form-control
            m-input ','placeholder'=>trans('main.address_room')]); ?>

        </div>
        <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
            <label for="exampleInputName"><?php echo trans('main.address_landmark'); ?></label>
            <?php echo Form::text('address_landmark',null,['class'=>'form-control
            m-input','id'=>'address_landmark','placeholder'=>trans('main.address_landmark')]); ?>

        </div>
        <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
            <label for="exampleInputName"><?php echo trans('main.address_additionalInformation'); ?></label>
            <?php echo Form::text('address_additionalInformation',null,['class'=>'form-control
            m-input','id'=>'address_additionalInformation','placeholder'=>trans('main.address_additionalInformation')]); ?>

        </div>
















        <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
            <label for="exampleInputName"><?php echo trans('main.referred_by'); ?></label>
            <?php echo Form::text('referred_by',null,['class'=>'form-control
            m-input','id'=>'referred_by','placeholder'=>trans('main.referred_by')]); ?>

        </div>
        <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
            <label for="name"><?php echo trans('main.responsables'); ?></label>
            <?php echo Form::select('responsables[]',App\Models\User::
                where(function($q){
                 if(!Auth()->user()->is_super_admin){
                        $q->where("team_leader_id",Auth()->user()->id);
                        $q->orWhere("manager_id",Auth()->user()->id);
                        $q->orWhere("id",Auth()->user()->id);
                    }

                })->    
                get()->pluck('name','id'),$resource->responsables(),['class'=>'form-control
            m-input select2','multiple','id'=>'phones']); ?>

        </div>
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <label for="notes"><?php echo trans('main.notes'); ?></label>
            <?php echo Form::textarea('notes',null,['class'=>'form-control
            m-input','id'=>'notes','placeholder'=>trans('main.notes')]); ?>

        </div>
    </div>


</div>

<?php echo $__env->make('clients._phones', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<?php /**PATH /var/www/html/invoices/resources/views/clients/_form.blade.php ENDPATH**/ ?>