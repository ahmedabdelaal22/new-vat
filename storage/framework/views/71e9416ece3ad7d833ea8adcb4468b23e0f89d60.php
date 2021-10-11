<?php $__currentLoopData = $breadcrumbs; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $name=>$link): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
<li class="m-nav__separator">-</li>
<li class="m-nav__item">
    <a href="<?php echo $link; ?>" class="m-nav__link">
        <span class="m-nav__link-text"><?php echo $name; ?></span>
    </a>
</li>
<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
<?php /**PATH /var/www/html/invoices/resources/views/layouts/_breadcrumb.blade.php ENDPATH**/ ?>