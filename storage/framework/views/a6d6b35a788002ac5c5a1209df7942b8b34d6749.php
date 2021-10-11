<!--begin::Base Scripts -->
<script src="<?php echo url('dashboard'); ?>/assets/vendors/base/vendors.bundle.js" type="text/javascript"></script>
<script src="<?php echo url('dashboard'); ?>/assets/demo/default/base/scripts.bundle.js" type="text/javascript"></script>
<script src="<?php echo asset('dashboard'); ?>/assets/vendors/custom/fullcalendar/fullcalendar.bundle.js" type="text/javascript"></script>

<script src="<?php echo url('dashboard'); ?>/assets/demo/default/base/scripts.custom.js" type="text/javascript"></script>
<!--begin::Page Vendors Scripts -->


<!--end::Page Vendors Scripts -->
<!--begin::Page Snippets -->
<!-- <script src="<?php echo url('dashboard'); ?>/assets/app/js/dashboard.js" type="text/javascript"></script> -->
<!--end::Page Snippets -->
<!--end::Page Vendors -->
<script src="<?php echo asset('dashboard'); ?>/assets/tinymce/tinymce.min.js" referrerpolicy="origin"></script> 
<script src="<?php echo asset('dashboard'); ?>/assets/demo/default/custom/crud/forms/widgets/select2.js" type="text/javascript"></script>
<script src="<?php echo asset('dashboard'); ?>/assets/demo/default/custom/crud/forms/widgets/form-repeater.js" type="text/javascript"></script>
<script src="<?php echo asset('dashboard'); ?>/assets/demo/default/custom/crud/forms/widgets/bootstrap-datetimepicker.js" type="text/javascript"></script>
<script>
    // tinymce.init(
    // {
    //     mode : "specific_textareas",
    //     plugins: "table image code ",
    //     table_appearance_options: false,
    //     editor_selector : "mceEditor",
    // }
    // );

</script>


<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.4/jquery-confirm.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.js"></script>

<script src="<?php echo asset('dashboard'); ?>/tagsinput.js"></script>

<!--end::Page Vendors Scripts -->

<!--begin::Page Resources -->
<!-- <script src="<?php echo asset('dashboard'); ?>/assets/demo/default/custom/components/calendar/basic.js" type="text/javascript"></script> -->

<script src="<?php echo asset('dashboard'); ?>/socket.io.js" type="text/javascript"></script>

<?php echo $__env->make('layouts.client_real_time_scripts', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/html/invoices/resources/views/layouts/scripts.blade.php ENDPATH**/ ?>