<!-- BEGIN: Header -->
<header id="m_header" class="m-grid__item    m-header " m-minimize-offset="200" m-minimize-mobile-offset="200">
    <div class="m-container m-container--fluid m-container--full-height">
        <div class="m-stack m-stack--ver m-stack--desktop">

            <!-- BEGIN: Brand -->
            <div class="m-stack__item m-brand  m-brand--skin-dark ">
                <div class="m-stack m-stack--ver m-stack--general">
                    <div class="m-stack__item m-stack__item--middle">
                        <a href="{!!url('/')!!}" class="m-brand__logo-wrapper text-center logo_link">
                            <img class="logo_img" src="{!!url('dashboard')!!}/images/_tanzem_logo.png">
                            <div class="company_name">company name</div>
                        </a>
                    </div>
                    <div class="m-stack__item m-stack__item--middle m-brand__tools">

                        <!-- BEGIN: Left Aside Minimize Toggle -->
                        <a href="javascript:;" id="m_aside_left_minimize_toggle"
                           class="m-brand__icon m-brand__toggler m-brand__toggler--left m--visible-desktop-inline-block  ">
                            <span></span>
                        </a>

                        <!-- END -->

                        <!-- BEGIN: Responsive Aside Left Menu Toggler -->
                        <a href="javascript:;" id="m_aside_left_offcanvas_toggle"
                           class="m-brand__icon m-brand__toggler m-brand__toggler--left m--visible-tablet-and-mobile-inline-block">
                            <span></span>
                        </a>

                        <!-- END -->

                        <!-- BEGIN: Responsive Header Menu Toggler -->
                        <a id="m_aside_header_menu_mobile_toggle" href="javascript:;"
                           class="m-brand__icon m-brand__toggler m--visible-tablet-and-mobile-inline-block">
                            <span></span>
                        </a>

                        <!-- END -->

                        <!-- BEGIN: Topbar Toggler -->
                        <a id="m_aside_header_topbar_mobile_toggle" href="javascript:;"
                           class="m-brand__icon m--visible-tablet-and-mobile-inline-block">
                            <i class="flaticon-more"></i>
                        </a>

                        <!-- BEGIN: Topbar Toggler -->
                    </div>
                </div>
            </div>

            <!-- END: Brand -->
            <div class="m-stack__item m-stack__item--fluid m-header-head" id="m_header_nav">

                <!-- BEGIN: Horizontal Menu -->
                <button class="m-aside-header-menu-mobile-close  m-aside-header-menu-mobile-close--skin-dark "
                        id="m_aside_header_menu_mobile_close_btn"><i class="la la-close"></i></button>
                <div id="m_header_menu"
                     class="m-header-menu m-aside-header-menu-mobile m-aside-header-menu-mobile--offcanvas  m-header-menu--skin-dark m-header-menu--submenu-skin-light m-aside-header-menu-mobile--skin-dark m-aside-header-menu-mobile--submenu-skin-dark ">

                    <ul class="m-menu__nav  m-menu__nav--submenu-arrow fast_links">

                        @if(Auth()->user()->is_super_admin || Auth()->user()->can('contact list index') ||
                        Auth()->user()->can('clients index') 
                        )
                        <li class="m-menu__item  m-menu__item--submenu m-menu__item--rel" m-menu-submenu-toggle="click"
                            m-menu-link-redirect="1" aria-haspopup="true">
                            <a href="javascript:;" class="m-menu__link m-menu__toggle">
                                <i class="m-menu__link-icon fa fa-th-list"></i>
                                <span class="m-menu__link-text">{{trans('main.menu')}}</span>
                            </a>
                            <div class="m-menu__submenu m-menu__submenu--classic m-menu__submenu--left top_nav_submenu">
                                <span class="m-menu__arrow m-menu__arrow--adjust"></span>
                                <ul class="m-menu__subnav">

                               

                                     @if(Auth()->user()->is_super_admin || Auth()->user()->can('clients index'))
                                    <li class="m-menu__item " aria-haspopup="true">
                                        <a href="{{route('clients.index')}}" class="m-menu__link ">
                                            <span class="m-menu__link-text">{{trans('main.clients')}}</span>
                                        </a>
                                    </li>
                                    @endif
                                    @if(empty(session('generatedAccessToken')))
                                    <li class="m-menu__item " aria-haspopup="true">
                                        <a href="{{route('loginInvoice')}}" class="m-menu__link ">
                                            <span class="m-menu__link-text">{{trans('main.loginInvoice')}}</span>
                                        </a>
                                    </li>
                                    @endif
                                    @if(!empty(session('generatedAccessToken')))
                                    <li class="m-menu__item " aria-haspopup="true">
                                        <a href="{{route('logoutInvoice')}}" class="m-menu__link ">
                                            <span class="m-menu__link-text">{{trans('main.logoutInvoice')}}</span>
                                        </a>
                                    </li>

                                     @endif
<!-- 
                                    @if(Auth()->user()->is_super_admin || Auth()->user()->can('contact list index'))
                                    <li class="m-menu__item " aria-haspopup="true">
                                        <a href="{{route('contact_list.index')}}" class="m-menu__link ">
                                            <i class="m-menu__link-icon flaticon-settings-1"></i>
                                            <span class="m-menu__link-text">{{trans('main.contact_list')}}</span>
                                        </a>
                                    </li>
                                    @endif
 -->

                                </ul>
                            </div>
                        </li>
                        @endif

                        @if(Auth()->user()->is_super_admin || Auth()->user()->can('users index'))
                        <li class="m-menu__item  m-menu__item--submenu m-menu__item--rel" m-menu-submenu-toggle="click"
                            m-menu-link-redirect="1" aria-haspopup="true">
                            <a href="javascript:;" class="m-menu__link m-menu__toggle">
                                <i class="m-menu__link-icon fa fa-users"></i>
                                <span class="m-menu__link-text">{{trans('main.users_management')}}</span>
                            </a>
                            <div class="m-menu__submenu m-menu__submenu--classic m-menu__submenu--left top_nav_submenu">
                                <span class="m-menu__arrow m-menu__arrow--adjust"></span>
                                <ul class="m-menu__subnav">

                                    <li class="m-menu__item " aria-haspopup="true">
                                        <a href="{{route('users.index')}}" class="m-menu__link ">
                                            <span class="m-menu__link-text">{{trans('main.users')}}</span>
                                        </a>
                                    </li>


                                </ul>
                            </div>
                        </li>

                        @endif

                    </ul>

                </div>

                <!-- END: Horizontal Menu -->


                <!-- BEGIN: Topbar -->
                <div id="m_header_topbar" class="m-topbar  m-stack m-stack--ver m-stack--general">
                    <div class="m-stack__item m-topbar__nav-wrapper">
                        <ul class="m-topbar__nav m-nav m-nav--inline">

{{--
                            <!--search part -->
                            <li class="m-nav__item m-dropdown m-dropdown--large m-dropdown--arrow m-dropdown--align-center m-dropdown--mobile-full-width m-dropdown--skin-light	m-list-search m-list-search--skin-light"
                                m-dropdown-toggle="click" id="m_quicksearch" m-quicksearch-mode="dropdown"
                                m-dropdown-persistent="1">
                                <a href="#" class="m-nav__link m-dropdown__toggle" data-toggle="m-tooltip"
                                   data-placement="top" title="" data-original-title="{{trans('main.search')}}">
									<span class="m-nav__link-icon">
										<i class="flaticon-search-1"></i>
									</span>
                                </a>
                                <div class="m-dropdown__wrapper">
                                    <span class="m-dropdown__arrow m-dropdown__arrow--center"></span>
                                    <div class="m-dropdown__inner ">
                                        <div class="m-dropdown__header">
                                            {!!
                                            Form::open(['method'=>'get','url'=>('search'),'class'=>'m-list-search__form'])!!}
                                            <div class="m-list-search__form-wrapper">
												<span class="m-list-search__form-input-wrapper">
													<input autocomplete="off" type="text" name="q" required="required"
                                                           class="m-list-search__form-input" value="{{request('q')}}"
                                                           placeholder="{{trans('main.search')}}">
												</span>
                                                <!-- <span class="m-list-search__form-icon-close" id="m_quicksearch_close">
                                                                    <i class="la la-remove"></i>
                                                                </span> -->
                                            </div>
                                            {!!Form::close()!!}
                                        </div>
                                        <div class="m-dropdown__body">
                                            <div class="m-dropdown__scrollable m-scrollable" data-scrollable="true"
                                                 data-height="300" data-mobile-height="200">
                                                <div class="m-dropdown__content">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <!--end search part -->
--}}

                            <li class="m-nav__item m-topbar__notifications m-topbar__notifications--img m-dropdown m-dropdown--large m-dropdown--header-bg-fill m-dropdown--arrow m-dropdown--align-center 	m-dropdown--mobile-full-width"
                                m-dropdown-toggle="click" m-dropdown-persistent="1">
                                <a href="#" class="m-nav__link m-dropdown__toggle" id="m_topbar_notification_icon"
                                   data-toggle="m-tooltip" data-placement="top" title=""
                                   data-original-title="{{trans('main.notifications')}}"
                                   onclick="showajaxnotfication('extensions');"
                                   >
									<span
                                        class="m-nav__link-badge m-badge m-badge--dot m-badge--dot-small m-badge--danger"></span>
                                    <span class="m-nav__link-icon">
										<i class="fa fa-bell"></i>
									</span>
                                </a>
                                <div class="m-dropdown__wrapper">
                                    <span class="m-dropdown__arrow m-dropdown__arrow--center"></span>
                                    <div class="m-dropdown__inner">
                                        <div class="m-dropdown__header m--align-center" style="">
                                            <span class="m-dropdown__header-title">{{trans('main.new')}} </span>
                                            <span class="m-dropdown__header-subtitle">
                                            {{trans('main.notifications')}}
                                            </span>
                                        </div>
                                        <div class="m-dropdown__body">
                                            <div class="m-dropdown__content">
                                                <ul class="nav nav-tabs m-tabs m-tabs-line m-tabs-line--brand"
                                                    role="tablist">
                                               
                                                    <li class="nav-item m-tabs__item">
                                                        <a class="nav-link m-tabs__link " data-toggle="tab"
                                                           href="#topbar_notifications_notifications" role="tab" onclick="showajaxnotfication('notifications');">
                                                           {{trans('main.notifications')}}
                                                        </a>
                                                    </li>

                                                    <li class="nav-item m-tabs__item">
                                                        <a class="nav-link m-tabs__link" data-toggle="tab"
                                                           href="#topbar_notifications_logs" role="tab" onclick="showajaxnotfication('logs');">{{trans('main.logs')}}   </a>
                                                    </li>
                                                </ul>
                                                <div class="tab-content">
                  
                                                    <div class="tab-pane active" id="topbar_notifications_notifications"
                                                         role="tabpanel">
                                                        <div class="m-scrollable" data-scrollable="true"
                                                             data-height="250" data-mobile-height="200">
                                                            <div class="m-list-timeline m-list-timeline--skin-light">


                                                                <div class="m-list-timeline__items">
                                                            

                                                                </div>
                                                                @if(Auth()->user()->is_super_admin || Auth()->user()->can("notfications index"))
                                                                <div class="more_btn">
                                                                    <a href="{!!route('notfications.index')!!}"
                                                                       class="btn btn-secondary btn-sm">{{trans("main.more_records")}}</a>
                                                                </div>
                                                                @endif
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="tab-pane" id="topbar_notifications_logs"
                                                         role="tabpanel">

                                                        <div class="m-scrollable" data-scrollable="true"
                                                             data-height="250" data-mobile-height="200">
                                                            <div class="m-list-timeline m-list-timeline--skin-light">
                                                                <div class="m-list-timeline__items" id="tablelogs">
                                                   

                                                                </div>
                                                            </div>
                                                            @if(Auth()->user()->is_super_admin || Auth()->user()->can("logs index"))
                                                            <div class="more_btn">
                                                                <a href="{!!url('logs')!!}"
                                                                   class="btn btn-secondary btn-sm">{{trans("main.more_records")}}</a>
                                                            </div>
                                                            @endif
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>

{{--
                            <li class="m-nav__item m-topbar__quick-actions m-topbar__quick-actions--img m-dropdown m-dropdown--large m-dropdown--header-bg-fill m-dropdown--arrow m-dropdown--align-right m-dropdown--align-push m-dropdown--mobile-full-width m-dropdown--skin-light"
                                m-dropdown-toggle="click">
                                <a href="#" class="m-nav__link m-dropdown__toggle" data-toggle="m-tooltip"
                                   data-placement="top" title="" data-original-title="{{trans('main.quick_action')}}">
                                    <span class="m-nav__link-badge m-badge m-badge--dot m-badge--info m--hide"></span>
                                    <span class="m-nav__link-icon">
										<i class="flaticon-share"></i>
									</span>
                                </a>
                                <div class="m-dropdown__wrapper">
									<span
                                        class="m-dropdown__arrow m-dropdown__arrow--right m-dropdown__arrow--adjust"></span>
                                    <div class="m-dropdown__inner">
                                        <div class="m-dropdown__header m--align-center" style="">
                                            <span class="m-dropdown__header-title">
                                            {{trans('main.quick_action')}}
                                            </span>
                                            <span class="m-dropdown__header-subtitle">{{trans('main.Shortcuts')}}</span>
                                        </div>
                                        <div class="m-dropdown__body m-dropdown__body--paddingless">
                                            <div class="m-dropdown__content">
                                                <div class="data" data="false" data-height="380"
                                                     data-mobile-height="200">
                                                    <div class="m-nav-grid m-nav-grid--skin-light">
                                                        <div class="m-nav-grid__row">


                                                            <a href="#"
                                                               class="m-nav-grid__item">
                                                                <i class="m-nav-grid__icon flaticon-settings-1">
                                                                    <span></span>
                                                                </i>
                                                                <span class="m-nav-grid__text">{{trans('main.title')}}</span>
                                                            </a>

                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
--}}


                            <li id="m_quick_sidebar_toggle" class="m-nav__item">
                                <a id="btnFullscreen" class="m-nav__link m-dropdown__toggle" data-toggle="m-tooltip"
                                   data-placement="top" title="" data-original-title="+/- {{trans('main.display')}}">
                    				<span class="m-nav__link-icon">
                    					<i class="fa fa-th-large"></i>
                    				</span>
                                </a>
                            </li>

                            <li id="m_quick_sidebar_toggle" class="m-nav__item">
                                <a id="btnFullscreen" class="m-nav__link " title="{{trans('main.'.App()->getLocale())}}" href="{{url('lang')}}">
                                   @if(App()->getLocale() == 'ar')
                                   <span class="m-nav__link-icon"><i class="la la-language"></i></span>
                                    @else
                                    <span class="m-nav__link-icon"><i class="la la-language"></i></span>
                                    @endif

                                </a>
                            </li>
                            <li class="m-nav__item m-topbar__user-profile  m-dropdown m-dropdown--medium m-dropdown--arrow  m-dropdown--align-right m-dropdown--mobile-full-width m-dropdown--skin-light user_profile_btn"
                                m-dropdown-toggle="click">
                                <a href="#" class="m-nav__link m-dropdown__toggle" data-toggle="m-tooltip"
                                   data-placement="top" title="" data-original-title="{{trans('main.profile')}}">
                                    <span class="m-topbar__userpic">
                                        @if(!empty(Auth::user()->image))
                                        <img src="{!!asset(Auth::user()->image)!!}"
                                             class="m--img-rounded m--marginless m--img-centered" alt=""/>

                                        @else
                                            {!! Auth()->user()->name!!}
                                        @endif
                                    </span>

                                    <span
                                        class="m-topbar__username m--hide">{!!Auth()->user()->name!!}</span>
                                </a>
                                <div class="m-dropdown__wrapper">
                                    <span
                                        class="m-dropdown__arrow m-dropdown__arrow--right m-dropdown__arrow--adjust"></span>
                                    <div class="m-dropdown__inner">
                                        <div class="user_dropdown">
                                            <div class="m-card-user m-card-user--skin-dark">
                                                <div class="m-card-user__pic">
                                                    <img src="{!!asset(Auth::user()->image)!!}"
                                                         class="m--img-rounded m--marginless" alt=""/>
                                                </div>
                                                <div class="m-card-user__details">
                                                    <span
                                                        class="m-card-user__name m--font-weight-500">{!!Auth()->user()->name!!}</span>
                                                    <a href=""
                                                       class="m-card-user__email m--font-weight-300 m-link">{!!Auth()->user()->email!!}</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="m-dropdown__body">
                                            <div class="m-dropdown__content">
                                                <a href="{{url('profile')}}" class="user_profile_link">
                                                            <i class="fa fa-user"></i>
                                                            <span class="m-nav__link-title">
                                                                <span class="m-nav__link-wrap">
                                                                    <span class="m-nav__link-text">
                                                                        {{trans('main.profile')}}
                                                                    </span>

                                                                </span>
                                                            </span>
                                                        </a>
                                                {{Form::open(['route'=>'logout','method'=>'POST'])}}
                                                        @csrf
                                                        <button class="base_btn logout_btn">
                                                            <i class="fa fa-sign-in-alt"></i>
                                                            <span>{{trans('main.logout')}}</span>
                                                        </button>
                                                        {{Form::close()}}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>

                <!-- END: Topbar -->
            </div>
        </div>
    </div>
</header>
