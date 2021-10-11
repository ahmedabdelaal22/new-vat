
<!-- <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.16/webfont.js"></script> -->
<script>
    WebFont.load({
        google: {
            "families": ["Poppins:300,400,500,600,700", "Roboto:300,400,500,600,700"]
        },
        active: function() {
            sessionStorage.fonts = true;
        }
    });
</script>

<!--end::Web font -->

<!--begin::Page Vendors Styles -->
<!--<link href="assets/vendors/custom/fullcalendar/fullcalendar.bundle.css" rel="stylesheet" type="text/css" />-->

<!-- <link rel="stylesheet" media="screen" href="https://fontlibrary.org/face/droid-arabic-kufi" type="text/css"/> -->


<?php if(app()->getLocale() == 'ar'): ?>
<link href="<?php echo url('dashboard/assets/vendors/custom/fullcalendar/fullcalendar.bundle.rtl.css'); ?>" rel="stylesheet" type="text/css" />
<?php else: ?>
<link href="<?php echo url('dashboard/assets/vendors/custom/fullcalendar/fullcalendar.bundle.css'); ?>" rel="stylesheet" type="text/css" />
<?php endif; ?>
<!--end::Page Vendors Styles -->

<!--begin::Base Styles -->
<?php if(app()->getLocale() == 'en'): ?>
<link href="<?php echo url('dashboard'); ?>/assets/vendors/base/vendors.bundle.css" rel="stylesheet" type="text/css" />

<link href="<?php echo url('dashboard'); ?>/assets/demo/default/base/style.bundle.css" rel="stylesheet" type="text/css" />
<?php endif; ?>
<?php if(app()->getLocale() == 'ar'): ?>
<!-- <link href="<?php echo url('dashboard'); ?>/assets/demo/default/base/datatables.bundle.rtl.css" rel="stylesheet" type="text/css" /> -->

<link href="<?php echo url('dashboard'); ?>/assets/vendors/base/vendors.bundle.rtl.css" rel="stylesheet" type="text/css" />


<link href="<?php echo url('dashboard'); ?>/assets/demo/default/base/style.bundle.rtl.css" rel="stylesheet" type="text/css" />
<?php endif; ?>


<!--end::Base Styles -->
<link rel="shortcut icon" href="<?php echo url('dashboard'); ?>/assets/demo/default/media/img/logo/favicon.ico" />



<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css"> -->

<link href="<?php echo url('dashboard'); ?>/tagsinput.css" rel="stylesheet" type="text/css" />

<link href="<?php echo url('dashboard'); ?>/assets/demo/default/base/style.custom.css" rel="stylesheet" type="text/css" />
<?php /**PATH /var/www/html/invoices/resources/views/layouts/styles.blade.php ENDPATH**/ ?>