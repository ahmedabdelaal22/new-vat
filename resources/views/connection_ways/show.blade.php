@extends('admin.layouts.app')
@section('title')@endsection
@section('header')@endsection
@section('breadcrumb')
@php($breadcrumbs=[trans('main.users')=>route('admin.users.index'),trans('main.update_data')=>route('admin.users.show',['id' => $resource->id])])
@includeWhen(isset($breadcrumbs),'admin.layouts._breadcrumb', ['breadcrumbs' =>$breadcrumbs ])
@endsection
@section('content')
<div class="m-content">
	<div class="row">
		<div class="col-xl-3 col-lg-4">
			<div class="m-portlet m-portlet--full-height  ">
				<div class="m-portlet__body">
					<div class="m-card-profile">
						<div class="m-card-profile__title m--hide">
							{!!$resource->name!!}
						</div>
						<div class="m-card-profile__pic">
							<div class="m-card-profile__pic-wrapper">
								<img src="{!! url($resource->image)!!}" alt="">
							</div>
						</div>
						<div class="m-card-profile__details">
							<span class="m-card-profile__name"> {{$resource->name}} </span>
							<a href="" class="m-card-profile__email m-link">
								{{$resource->email}}
							</a>
						</div>
					</div>
					<!-- <ul class="m-nav m-nav--hover-bg m-portlet-fit--sides">
						<li class="m-nav__separator m-nav__separator--fit"></li>
						<li class="m-nav__section m--hide">
							<span class="m-nav__section-text">Section</span>
						</li>
						<li class="m-nav__item">
							<a href="../header/profile&amp;demo=default.html" class="m-nav__link">
								<i class="m-nav__link-icon flaticon-profile-1"></i>
								<span class="m-nav__link-title">
									<span class="m-nav__link-wrap">
										<span class="m-nav__link-text">My Profile</span>
										<span class="m-nav__link-badge">
											<span class="m-badge m-badge--success">2</span>
										</span>
									</span>
								</span>
							</a>
						
					</ul> -->
					<div class="m-portlet__body-separator"></div>
					
				</div>
			</div>
		</div>
		<div class="col-xl-9 col-lg-8">
			<div class="m-portlet m-portlet--full-height m-portlet--tabs  ">
				<div class="m-portlet__head">
					<div class="m-portlet__head-tools">
						<ul class="nav nav-tabs m-tabs m-tabs-line   m-tabs-line--left m-tabs-line--primary" role="tablist">
							<li class="nav-item m-tabs__item">
								<a class="nav-link m-tabs__link active" data-toggle="tab" href="#m_user_profile_tab_1" role="tab">
									<i class="flaticon-share m--hide"></i>
									{{trans('main.profile')}}
								</a>
							</li>
							<li class="nav-item m-tabs__item">
								<a class="nav-link m-tabs__link" data-toggle="tab" href="#m_user_profile_tab_2" role="tab">
									{{trans('main.companies')}}
								</a>
							</li>
							<li class="nav-item m-tabs__item">
								<a class="nav-link m-tabs__link" data-toggle="tab" href="#m_user_profile_tab_3" role="tab">
									{{trans('main.tasks')}}
								</a>
							</li>
						</ul>
					</div>
					
				</div>
				<div class="tab-content">
					<div class="tab-pane active" id="m_user_profile_tab_1">
						<form class="m-form m-form--fit m-form--label-align-right">
							<div class="m-portlet__body">
								
								{!! Form::model($resource,['method'=>'put','route'=>['admin.users.update',$resource->id],'files'=>'true','class'=>'m-form m-form--fit m-form--label-align-right m-form--group-seperator-dashed'])!!}
                				@include('admin.users._form')
							</div>
							<div class="m-portlet__foot m-portlet__foot--fit">
								<div class="m-form__actions">
									<div class="row">
										<div class="col-2">
										</div>
										<div class="col-7">
											<button type="submit" class="btn btn-accent m-btn m-btn--air m-btn--custom">
												{{trans('main.save')}}
											</button>&nbsp;&nbsp;
											<button type="reset" class="btn btn-secondary m-btn m-btn--air m-btn--custom">
											{{trans('main.cancel')}}
										</button>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
					<div class="tab-pane " id="m_user_profile_tab_2">
						<table class="table table-striped- table-bordered dataTable table-hover table-checkable">
							<thead>
								<th>#</th>
								<th>{{trans('main.name')}}</th>
							</thead>
							<tbody>
							@foreach($resource->companies as $company)
								<tr>
									<td>
										{{$loop->iteration}}
									</td>
									<td>
										{{$company->name}}
									</td>
								</tr>
							@endforeach	
							</tbody>
						</table>
					</div>
					<div class="tab-pane " id="m_user_profile_tab_3">
						<table class="table table-striped- table-bordered dataTable table-hover table-checkable">
							<thead>
								<th>#</th>
								<th colspan="2">{{trans('main.name')}}</th>
							</thead>
							<tbody>
							@foreach($resource->tasks as $task)
								<tr>
									<td>
										{{$loop->iteration}}
									</td>
									<td>

											{{$task->title}}
										</a>
									</td>
									<td>
									@if(in_array('tasks.show',authUserPermissions))

                    
					               <a href="{!!route('admin.tasks.show',['id' => $task->id])!!}" class="m-portlet__nav-link btn m-btn 
					                    m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" data-toggle="m-tooltip" data-placement="top" title="" data-original-title="معاينة">
					                            <i class="la la-eye"></i>
					                        </a>
                    
                    				@endif
									</td>
								</tr>
							@endforeach	
							</tbody>
						</table>

					</div>
				</div>
			</div>
		</div>
	</div>
</div>
@endsection
@section('scripts')@endsection
