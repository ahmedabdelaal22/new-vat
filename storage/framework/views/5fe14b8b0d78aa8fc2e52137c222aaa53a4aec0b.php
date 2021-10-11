<!DOCTYPE html>
<html <?php echo e((app()->getLocale() == 'ar') ? ' lang="ar" dir="rtl" ' :  ' lang="en" dir="ltr" '); ?>>
<!-- begin::Head -->

<head>
    <meta charset="utf-8" />
    <title> <?php echo e(trans('main.invoices')); ?> ||<?php echo $__env->yieldContent('title'); ?></title>
    <meta name="csrf-token" content="<?php echo e(csrf_token()); ?>">
    <meta name="description" content="Blank inner page examples">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <!--begin::Web font -->

    <link href="<?php echo asset('dashboard'); ?>/assets/vendors/custom/datatables/datatables.bundle.css" rel="stylesheet"
        type="text/css" />

    <?php echo $__env->make('layouts.styles', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>

    <?php echo $__env->yieldPushContent('header'); ?>
</head>
<!-- end::Head -->
<!-- begin::Body -->

<body
    class="m-page--fluid m--skin- m-content--skin-light2 m-header--fixed m-header--fixed-mobile m-aside-left--enabled m-aside-left--skin-dark m-aside-left--offcanvas m-footer--push m-aside--offcanvas-default">
    <!-- begin:: Page -->
    <div class="m-grid m-grid--hor m-grid--root m-page">
        <?php echo $__env->make('layouts._navbar', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <!-- END: Header -->
        <!-- begin::Body -->
        <div class="m-grid__item m-grid__item--fluid m-grid m-grid--ver-desktop m-grid--desktop m-body">

            <!-- BEGIN: Left Aside -->
            <?php echo $__env->make('layouts._sidebar', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
            <!-- END: Left Aside -->
            <div class="m-grid__item m-grid__item--fluid m-wrapper">
                <!-- BEGIN: Subheader -->
                <div class="m-subheader ">
                    <div class="d-flex align-items-center">
                        <div class="mr-auto">
                            <h3 class="m-subheader__title m-subheader__title--separator "><?php echo $__env->yieldContent('title'); ?></h3>
                            <ul class="m-subheader__breadcrumbs m-nav m-nav--inline">
                                <li class="m-nav__item m-nav__item--home">
                                    <a href="<?php echo url('/'); ?>" class="m-nav__link m-nav__link--icon">
                                        <i class="m-nav__link-icon fa fa-home"></i>
                                    </a>
                                </li>
                                <?php echo $__env->yieldContent('breadcrumb'); ?>
                            </ul>
                        </div>
                    </div>
                    <div class="alert_top">
                        <?php if($errors->any()): ?>
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            </button>
                            <ul>
                                <?php $__currentLoopData = $errors->all(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $error): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <li><?php echo e($error); ?></li>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </ul>
                        </div>
                        <?php endif; ?>
                    </div>
                </div>
                <!-- END: Subheader -->
                <div class="m-content">

                    <?php echo $__env->yieldContent('content'); ?>
                    
                </div>
            </div>

            <?php echo $__env->make('layouts.chat', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>

        </div>
        <!-- end:: Body -->

        <!-- begin::Footer -->
        <?php echo $__env->make('layouts._footer', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <!-- end::Footer -->
    </div>
    <!-- end:: Page -->
    <!-- Modal Header -->
    <div class="modal" id="myModalNodelted">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title"> <?php echo e(trans('main.no_delted')); ?></h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body" id="message_no_deleted">
                 
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal"><?php echo e(trans('main.close')); ?></button>
                </div>

            </div>
        </div>
    </div>

    <!-- begin::Quick Nav -->

    <?php echo $__env->make('layouts.scripts', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>

    <!-- toaster messages  -->

    <?php echo app('toastr')->render(); ?>


    <?php echo $__env->yieldContent('scripts'); ?>

    <script>
        $(document).on('change', '.connection_way', function (e) {
            e.preventDefault();
            connection_way_status($(this));
        });

        function connection_way_status(inputObject) {

            var connection_way_id = inputObject.val();
            var route = "<?php echo url('ajax_connection_way_status'); ?>";
            var statusesInput = inputObject.parents().find('.connection_way_status');

            $.ajax({
                type: "Get",
                url: route,
                data: {
                    connection_way_id: connection_way_id
                },
                dataType: 'json', // Define data type will be JSON
                success: function (result) {
                    var connection_status = result.connection_status;
                    statusesInput.children().remove();
                    // remove old options
                    statusesInput.append(
                        '<option value=""><?php echo e(trans("main.connection_way_status")); ?></option>');
                    connection_status.forEach(function (entry) {
                        statusesInput.append('<option value="' + entry.id + '">' + entry.name +
                            '</option>');
                    });
                },
                error: function (error) {
                    $("#ajaxResponse").append("<div>" + error + "</div>");
                }
            }); //end ajax
        }

        $('.date-picker').datepicker({
            rtl: true,
            format: 'yyyy-mm-dd'
        });
        $('.time-picker').timepicker();
        $('.select_2').select2();
        $('.select2').select2();


        function loadSelect2Ajax() {


            let url = "<?php echo e(route("getAutoComplete",[])); ?>";
            $(".select2_ajax").unbind("change").select2({
                placeholder: "<?php echo e(trans("main.search")); ?>",
                allowClear: true,
                ajax: {
                    url: url,
                    type: "POST",
                    dataType: 'json',
                    delay: 250,
                    data: function (params) {
                        console.log('tes'+$(this).attr("id"));
                        return {
                            "_token": "<?php echo e(csrf_token()); ?>",
                            external_module: $(this).attr("id"),
                            q: params.term, // s
                            page: params.page
                        };
                    },
                    processResults: function (data, params) {


                        // parse the results into the format expected by Select2
                        // since we are using custom formatting functions we do not need to
                        // alter the remote JSON data, except to indicate that infinite
                        // scrolling can be used
                        params.page = params.page || 1;

                        return {
                            results: data.items,
                            pagination: {
                                more: (params.page * 30) < data.total_count
                            }
                        };
                    },
                    cache: true
                },
                escapeMarkup: function (markup) {
                    return markup;
                }, // let our custom formatter work
                minimumInputLength: 1,
                templateResult: formatRepo, // omitted for brevity, see the source of this page
                templateSelection: formatRepoSelection // omitted for brevity, see the source of this page
            });
        }

        function clearFormData() {
            $('.select2-selection__clear').trigger('mousedown');
            $(".multi_select").val(null).trigger('change');
            $(".filterDataForm select,input").val("");
            var url =
                "<?php echo e((request()->fullUrl() == request()->url()) ? request()->url().'?' : request()->fullUrl().'&'); ?>" +
                "&search_query=" + "";
            loadTableData(url);
        };

        $('.show_filter').on('click', function (event) {
            $('.filter_section').slideToggle();
            $('.client_download').slideUp();
        });

        $('.upload_btn').on('click', function (event) {
            $('.client_download').slideToggle();
            $('.filter_section').slideUp();
        });


        $('#clear').on('click', function (event) {
            clearFormData();
        });

        $(document).on('submit', '.filterDataForm', function (e) {
            e.preventDefault();
            var url =
                "<?php echo e((request()->fullUrl() == request()->url()) ? request()->url().'?' : request()->fullUrl().'&'); ?>" +
                $("#filterDataForm").serialize();
            loadTableData(url);

        });

        $(document).on('change keyup', '.filterDataForm', function () {

            var url =
                "<?php echo e((request()->fullUrl() == request()->url()) ? request()->url().'?' : request()->fullUrl().'&'); ?>" +
                $("#filterDataForm").serialize();
            loadTableData(url);

        });

        $(document).on('click', '.export_excel', function () {
            var url =
                "<?php echo e((request()->fullUrl() == request()->url()) ? request()->url().'/export_excel?' : request()->fullUrl().'/export_excel&'); ?>" +
                $("#filterDataForm").serialize();
            window.location.href = url;

        });

        $(document).on('click', '.export_pdf', function () {
            var url =
                "<?php echo e((request()->fullUrl() == request()->url()) ? request()->url().'/export_pdf?' : request()->fullUrl().'/export_pdf&'); ?>" +
                $("#filterDataForm").serialize();
            window.location.href = url;

        });


        // custom styles

        // tagging support
        $('#kt_select2_12_1, #kt_select2_12_2, #kt_select2_12_3, #kt_select2_12_4').select2({
            placeholder: "Select an option",
        });


        $(document).on('click', '.destroy', function () {
            var route = $(this).data('route');
            $.confirm({
                title: "<?php echo e(trans('main.are_you_sure_to_delete')); ?>",
                content: "",
                type: 'red',
                buttons: {
                    ok: {
                        text: "<?php echo e(trans('main.ok')); ?>",
                        btnClass: 'btn-danger',
                        keys: ['enter'],
                        action: function () {
                            $.ajaxSetup({
                                headers: {
                                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr(
                                        'content')
                                }
                            });
                            $.ajax({
                                url: route,
                                type: 'DELETE', // replaced from put
                                dataType: "JSON",
                                acync: true,
                                // data : {
                                //     _method : 'DELETE',
                                // },
                                success: function (response) {

                                    if (response.status == 1) {

                                        $("#removable" + response.data.id).remove();
                                        swal("", response.message, "success")
                                    }
                                    if (response.status == 0) {

                                        $("#message_no_deleted").text(response.message);
                                        $('#myModalNodelted').modal('show');
                                    }
                                },
                                error: function (xhr) {
                                    ///
                                }
                            });

                        }
                    },
                    cancel: {
                        text: "<?php echo e(trans('main.cancel')); ?>",
                        btnClass: 'btn-success'
                    }
                }
            });
        });
        $(document).on('click', '.close', function () {
            var route = $(this).data('route');
            $.confirm({
                title: "<?php echo e(trans('main.are_you_sure_to_close')); ?>",
                content: "<?php echo e(trans('main.close_operation_lead')); ?>",
                type: 'red',
                buttons: {
                    ok: {
                        text: "<?php echo e(trans('main.ok')); ?>",
                        btnClass: 'btn-danger',
                        keys: ['enter'],
                        action: function () {
                            $.ajaxSetup({
                                headers: {
                                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr(
                                        'content')
                                }
                            });
                            $.ajax({
                                url: route,
                                type: 'get', // replaced from put
                                dataType: "JSON",
                                acync: true,
                                // data : {
                                //     _method : 'DELETE',
                                // },
                                success: function (response) {

                                    console.log(response);
                                    if (response.status == 1) {

                                        $("#close" + response.data.id).remove();

                                        swal("", response.message, "success")
                                    }
                                },
                                error: function (xhr) {
                                    ///
                                }
                            });

                        }
                    },
                    cancel: {
                        text: "<?php echo e(trans('main.cancel')); ?>",
                        btnClass: 'btn-success'
                    }
                }
            });
        });
        $(document).on('click', '.confirem', function () {
            var route = $(this).data('route');
            $.confirm({
                title: "<?php echo e(trans('main.are_you_sure_to_confirem')); ?>",
                content: "",
                type: 'red',
                buttons: {
                    ok: {
                        text: "<?php echo e(trans('main.ok')); ?>",
                        btnClass: 'btn-danger',
                        keys: ['enter'],
                        action: function () {
                            $.ajaxSetup({
                                headers: {
                                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr(
                                        'content')
                                }
                            });
                            $.ajax({
                                url: route,
                                type: 'get', // replaced from put
                                dataType: "JSON",
                                acync: true,
                                // data : {
                                //     _method : 'DELETE',
                                // },
                                success: function (response) {

                                    console.log(response);

                                    if (response.status == 1) {
                                        $(".confirmed_at" + response.data.id).text(
                                            response.data.confirmed_at);

                                        $(".confirmed" + response.data.id).remove();
                                        $(".edit" + response.data.id).remove();
                                        $(".deleted" + response.data.id).remove();
                                        swal("", response.message, "success")
                                    }

                                },
                                error: function (xhr) {
                                    ///
                                }
                            });

                        }
                    },
                    cancel: {
                        text: "<?php echo e(trans('main.cancel')); ?>",
                        btnClass: 'btn-success'
                    }
                }
            });
        });

        function loadTableData(url) {
            // console.log(url);
            $.ajax({
                url: url
            }).done(function (data) {
                $('#table-data').html(data);
                $('#load').removeClass("show");

                // referechDataTable();
            }).fail(function () {
                alert('an error in loading .');
            });
        }
        function showajaxnotfication(page_url) {
    
            $.ajax({
                url: "<?php echo e(url('showajaxnotfication')); ?>",
                data: {
                    page_url: page_url
                }
            }).done(function (data) {
                $('#table'+page_url).html(data);
            }).fail(function () {
                alert('an error in loading .');
            });
        }

        $(function () {

            $(document).on('keyup', '.serach', function () {

                $('#load').addClass('show');
                var query = $('#serach').val();
                var column_name = $('#hidden_column_name').val();
                // var sort_type = $('#hidden_sort_type').val();
                // console.log(sort_type);
                var url =
                    "<?php echo e((request()->fullUrl() == request()->url()) ? request()->url().'?' : request()->fullUrl().'&'); ?>" +
                    "&search_query=" + query;
                loadTableData(url);
            });

            loadSelect2Ajax(); // select2 ajax for auto complete

            $(document).on('change', '#limit', function () {

                $('#load').addClass('show');
                console.log(limit);
                var limit = $('#limit').val();
                // var search_query = $('#serach').val();
                // var column_name = $('#hidden_column_name').val();
                // var sort_type = $('#hidden_sort_type').val();
                var url =
                    "<?php echo e((request()->fullUrl() == request()->url()) ? request()->url().'?' : request()->fullUrl().'&'); ?>" +
                    "limit=" + limit + "&" + $("#filterDataForm").serialize();
                loadTableData(url);
            });
            /*
                    $(document).on('click', '.sorting', function () {

                        $('#load').addClass('show');
                        var column_name = $(this).data('column_name');
                        var order_type = $(this).data('sorting_type');

                        var reverse_order = '';
                        if (order_type == 'asc') {
                            reverse_order = 'desc';

                            // clear_icon();
                            $('#' + column_name + '_icon').html(
                                '<span class="glyphicon glyphicon-triangle-bottom"></span>');

                        }
                        if (order_type == 'desc') {

                            reverse_order = 'asc';

                            // clear_icon();
                            $('#' + column_name + '_icon').html(
                                '<span class="glyphicon glyphicon-triangle-top"></span>');
                        }
                        $('#hidden_column_name').val(column_name);
                        $('#hidden_sort_type').val(reverse_order);

                        var page = $('#hidden_page').val();

                        $(this).data('sorting_type', reverse_order);
                        url = "<?php echo e((request()->fullUrl() == request()->url()) ? request()->url().'?' : request()->fullUrl().'&'); ?>page=" + page + "&sortby=" + column_name +
                    "&sorttype=" + reverse_order + "&" + $("#filterDataForm").serialize();
                var limit = $('#limit').val();
                var query = $('#serach').val();
                if (limit) {
                    url += "&limit=" + limit;
                }
                if (query) {
                    url += "&query=" + query;
                }
                loadTableData(url);
                window.history.pushState("", "", url);
            });
            */
            $(document).on('click', '.pagination a', function (event) {
                event.preventDefault();
                $('#load').addClass('show');
                var url = $(this).attr('href') + "&" + $("#filterDataForm").serialize();
                loadTableData(url);
            });

            // referechDataTable();


        });

        /*    function referechDataTable() {
                // begin first table
                $('#m_table_1').DataTable({
                    responsive: true,
                    //== Pagination settings
                    dom: `<'col-sm-12 text-right'B>
                    `,
                    buttons: [
                        'print',
                        'copyHtml5',
                        'excelHtml5',
                        'csvHtml5',
                        'pdfHtml5',
                    ],

                });

            }*/

        function formatRepo(repo) {
            if (repo.loading) return repo.text;
            var markup = "<div class='select2-result-repository clearfix'>" +
                "<div class='select2-result-repository__meta'>" +
                "<div class='select2-result-repository__title'>" + repo.name + "</div>";
            if (repo.description) {
                markup += "<div class='select2-result-repository__description'>" + repo.description + "</div>";
            }
            console.log("b");
            console.log(repo.name);

            return repo.name ? markup : "<span><?php echo e(trans("main.select_value")); ?></span>";
        }

        function formatRepoSelection(repo) {

            console.log("a");
            console.log(repo.name);
            var markup = "<div class='select2-result-repository clearfix'>" +
                "<div class='select2-result-repository__meta'>" +
                "<div class='select2-result-repository__title'>" + repo.name + "</div>";

            return repo.name ? markup : "<span><?php echo e(trans("main.select_value")); ?></span>";
        }

    </script>
    <!--end::Global Theme Bundle -->

    <!--begin::Page Vendors -->
    <script src="<?php echo asset('dashboard'); ?>/assets/vendors/custom/datatables/datatables.bundle.js" type="text/javascript">
    </script>


    <!--begin::Page Scripts -->
    
    


</body>
<!-- end::Body -->

</html>
<?php /**PATH /var/www/html/invoices/resources/views/layouts/app.blade.php ENDPATH**/ ?>