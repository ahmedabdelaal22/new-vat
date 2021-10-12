<!DOCTYPE html>
<html lang="ar">
	<!-- begin::Head -->
	<head>
		<meta charset="utf-8" />
		<title>{{trans('main.not_allowed_page')}}</title>
		<meta name="description" content="Latest updates and statistic charts">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">

		<!--begin::Web font -->
		<script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.16/webfont.js"></script>
		@include('layouts.styles')
	</head>

	<!-- end::Head -->

	<!-- begin::Body -->
	<body class="m--skin- m-header--fixed m-header--fixed-mobile m-aside-left--enabled m-aside-left--skin-dark m-aside-left--fixed m-aside-left--offcanvas m-footer--push m-aside--offcanvas-default">

		<!-- begin:: Page -->
		<div class="m-grid m-grid--hor m-grid--root m-page">
			<div class="m-grid__item m-grid__item--fluid m-grid  m-error-6" style="background-image: url({{url('dashboard/images/not_allowed.jpg')}});">
				<div class="m-error_container">
					<div class="m-error_subtitle m--font-light">
						<h1>{{trans('main.sorry')}}</h1>
					</div>
					<p class="m-error_description m--font-light">
						{{trans('main.not_allowed_page')}}
					</p>
				</div>
			</div>
		</div>

		<!-- end:: Page -->
		@include('layouts.scripts')
	</body>

	<!-- end::Body -->
</html>