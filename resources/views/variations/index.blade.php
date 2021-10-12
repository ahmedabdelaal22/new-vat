@extends('layouts.app')
@section('title') {{trans('main.'.$basicRoute)}} @endsection
@section('header')@endsection
@section('breadcrumb')
@php($breadcrumbs=[trans('main.'.$basicRoute)=>route($basicRoute.'.index'),])
@includeWhen(isset($breadcrumbs),'layouts._breadcrumb', ['breadcrumbs' =>$breadcrumbs ])
@endsection
@section('content')

 <div class="m-portlet m-portlet--mobile">
    <div class="m-portlet__head">
        <div class="m-portlet__head-caption">
            <div class="m-portlet__head-title">
                <h3 class="m-portlet__head-text">
                   {{trans('main.'.$basicRoute)}}
                </h3>
            </div>
        </div>

        <div class="m-portlet__head-tools">
            <ul class="m-portlet__nav">
                <li class="m-portlet__nav-item">
                    <a href="{!!route($basicRoute.'.create')!!}" class="btn btn-primary m-btn m-btn--custom m-btn--icon m-btn--air">
                        <span>
                            <i class="la la-plus"></i>
                            <span>{{trans('main.add')}}</span>
                        </span>
                    </a>
                </li>
                <li class="m-portlet__nav-item"></li>

            </ul>
        </div>

    </div>
    <div class="m-portlet__body ">
        <div id="m_table_1_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">

            <div class="data" id="table-data">
                @include($basicRoute.'._table')
            </div>
        </div>
    </div>
</div>

 @endsection
@section('scripts')


<script type="text/javascript">

    $(function () {
        function clear_icon() {
            $('#name_icon').html('');
            $('#email_icon').html('');

        }
        $(document).on('keyup', '#serach', function(){
            $('#load').addClass('show');
             var query = $('#serach').val();
             var limit =  $('#limit').val();
             var column_name = $('#hidden_column_name').val();
             var sort_type = $('#hidden_sort_type').val();
             var page = $('#hidden_page').val();
             var  url = "{{url('/')}}/admin/users?page=" + page + "&sortby=" + column_name +
                "&sorttype=" + sort_type+"&query="+query+"&limit="+limit;

            getArticles(url);

            });
            $(document).on('change', '#limit', function() {
                $('#load').addClass('show');
                var limit =  $('#limit').val();
                var query = $('#serach').val();
                var column_name = $('#hidden_column_name').val();
                var sort_type = $('#hidden_sort_type').val();
                var page = $('#hidden_page').val();
                var  url = "{{url('/')}}/admin/users?page=" + page + "&sortby=" + column_name +
                "&sorttype=" + sort_type+"&query="+query+"&limit="+limit;

                getArticles(url);
          });

        $(document).on('click', '.sorting', function () {
            $('#load').addClass('show');
            var column_name = $(this).data('column_name');

            var order_type = $(this).data('sorting_type');

            var reverse_order = '';
            if (order_type == 'asc') {
               reverse_order = 'desc';

                clear_icon();
                $('#' + column_name + '_icon').html(
                    '<span class="glyphicon glyphicon-triangle-bottom"></span>');

            }
            if (order_type == 'desc') {

                reverse_order = 'asc';

                clear_icon();
                $('#' + column_name + '_icon').html(
                    '<span class="glyphicon glyphicon-triangle-top"></span>');
            }
            $('#hidden_column_name').val(column_name);
            $('#hidden_sort_type').val(reverse_order);

            var page = $('#hidden_page').val();

            $(this).data('sorting_type', reverse_order);
            url = "{{url('/')}}/admin/users?page=" + page + "&sortby=" + column_name +
                "&sorttype=" + reverse_order;
                var limit =  $('#limit').val();
            var query = $('#serach').val();
            if(limit){
                url += "&limit=" + limit;
            }
            if(query){
                url += "&query=" + query;
            }
            getArticles(url);
            window.history.pushState("", "", url);
        });
        $(document).on('click', '.pagination a', function (event) {
            event.preventDefault();
            $('#load').addClass('show');


            var page = $(this).attr('href').split('page=')[1];
            $('#hidden_page').val(page);
            var column_name = $('#hidden_column_name').val();
            var sort_type = $('#hidden_sort_type').val();


            $('li').removeClass('active');
            $(this).parent().addClass('active');
            var url = "{{url('/')}}/admin/users?page=" + page;
            if (column_name && sort_type) {
                url += "&sortby=" + column_name + "&sorttype=" + sort_type;
            }
            var limit =  $('#limit').val();
            var query = $('#serach').val();
            if(limit){
                url += "&limit=" + limit;
            }
            if(query){
                url += "&query=" + query;
            }
            getArticles(url);
            window.history.pushState("", "", url);
        });


    });

</script>





@endsection

