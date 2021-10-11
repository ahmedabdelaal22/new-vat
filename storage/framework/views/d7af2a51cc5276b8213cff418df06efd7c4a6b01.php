<?php $__currentLoopData = $users; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $user): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
    <a href="<?php echo e(route('chats.index',['to_id'=>$user->id])); ?>" data-route="<?php echo e(route('chats.show',$user->id)); ?>" class="startChatWithUser" data-id=<?php echo e($user->id); ?>>
        <div class="m-widget3__item">
            <div class="m-widget3__header">
                <div class="m-widget3__user-img">
                    <?php if(!empty($user->image)): ?>
                        <img class="m-widget3__img" src="<?php echo e(url($user->image)); ?>" alt="">
                    <?php endif; ?>
                    
                </div>
                <div class="m-widget3__info">
                    <div class="d-flex">
                        <span class="m-badge <?php echo e(($user->is_online == 1) ? 'm-badge--success':'m-badge--danger'); ?> online_user_<?php echo e($user->id); ?> chat_users_icon"  style="min-width: 7px;min-height:7px;">
                        </span>
                        <span class="m-widget3__username">
                           <div><?php echo e($user->name); ?></div>
                            <div><?php echo e($user->email); ?></div>
                        </span>
                    </div>                
                </div>
            </div>
        </div>
    </a>
<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?><?php /**PATH /var/www/html/invoices/resources/views/chats/chat_box_users.blade.php ENDPATH**/ ?>