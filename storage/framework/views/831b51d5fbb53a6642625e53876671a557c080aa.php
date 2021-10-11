<!-- BEGIN: Header -->
<header id="m_header" class="m-grid__item    m-header " m-minimize-offset="200" m-minimize-mobile-offset="200">
    <div class="m-container m-container--fluid m-container--full-height">
        <div class="m-stack m-stack--ver m-stack--desktop">

            <!-- BEGIN: Brand -->
            <div class="m-stack__item m-brand  m-brand--skin-dark ">
                <div class="m-stack m-stack--ver m-stack--general">
                    <div class="m-stack__item m-stack__item--middle">
                        <a href="<?php echo url('/'); ?>" class="m-brand__logo-wrapper text-center logo_link">
                            <img class="logo_img" src="<?php echo url('dashboard'); ?>/images/_tanzem_logo.png">
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

                        <?php if(Auth()->user()->is_super_admin || Auth()->user()->can('contact list index') ||
                        Auth()->user()->can('clients index') 
                        ): ?>
                        <li class="m-menu__item  m-menu__item--submenu m-menu__item--rel" m-menu-submenu-toggle="click"
                            m-menu-link-redirect="1" aria-haspopup="true">
                            <a href="javascript:;" class="m-menu__link m-menu__toggle">
                                <i class="m-menu__link-icon fa fa-th-list"></i>
                                <span class="m-menu__link-text"><?php echo e(trans('main.menu')); ?></span>
                            </a>
                            <div class="m-menu__submenu m-menu__submenu--classic m-menu__submenu--left top_nav_submenu">
                                <span class="m-menu__arrow m-menu__arrow--adjust"></span>
                                <ul class="m-menu__subnav">

                               

                                     <?php if(Auth()->user()->is_super_admin || Auth()->user()->can('clients index')): ?>
                                    <li class="m-menu__item " aria-haspopup="true">
                                        <a href="<?php echo e(route('clients.index')); ?>" class="m-menu__link ">
                                            <span class="m-menu__link-text"><?php echo e(trans('main.clients')); ?></span>
                                        </a>
                                    </li>
                                    <?php endif; ?>
                                    <?php if(empty(session('generatedAccessToken'))): ?>
                                    <li class="m-menu__item " aria-haspopup="true">
                                        <a href="<?php echo e(route('loginInvoice')); ?>" class="m-menu__link ">
                                            <span class="m-menu__link-text"><?php echo e(trans('main.loginInvoice')); ?></span>
                                        </a>
                                    </li>
                                    <?php endif; ?>
                                    <?php if(!empty(session('generatedAccessToken'))): ?>
                                    <li class="m-menu__item " aria-haspopup="true">
                                        <a href="<?php echo e(route('logoutInvoice')); ?>" class="m-menu__link ">
                                            <span class="m-menu__link-text"><?php echo e(trans('main.logoutInvoice')); ?></span>
                                        </a>
                                    </li>

                                     <?php endif; ?>
<!-- 
                                    <?php if(Auth()->user()->is_super_admin || Auth()->user()->can('contact list index')): ?>
                                    <li class="m-menu__item " aria-haspopup="true">
                                        <a href="<?php echo e(route('contact_list.index')); ?>" class="m-menu__link ">
                                            <i class="m-menu__link-icon flaticon-settings-1"></i>
                                            <span class="m-menu__link-text"><?php echo e(trans('main.contact_list')); ?></span>
                                        </a>
                                    </li>
                                    <?php endif; ?>
 -->

                                </ul>
                            </div>
                        </li>
                        <?php endif; ?>

                        <?php if(Auth()->user()->is_super_admin || Auth()->user()->can('users index')): ?>
                        <li class="m-menu__item  m-menu__item--submenu m-menu__item--rel" m-menu-submenu-toggle="click"
                            m-menu-link-redirect="1" aria-haspopup="true">
                            <a href="javascript:;" class="m-menu__link m-menu__toggle">
                                <i class="m-menu__link-icon fa fa-users"></i>
                                <span class="m-menu__link-text"><?php echo e(trans('main.users_management')); ?></span>
                            </a>
                            <div class="m-menu__submenu m-menu__submenu--classic m-menu__submenu--left top_nav_submenu">
                                <span class="m-menu__arrow m-menu__arrow--adjust"></span>
                                <ul class="m-menu__subnav">

                                    <li class="m-menu__item " aria-haspopup="true">
                                        <a href="<?php echo e(route('users.index')); ?>" class="m-menu__link ">
                                            <span class="m-menu__link-text"><?php echo e(trans('main.users')); ?></span>
                                        </a>
                                    </li>


                                </ul>
                            </div>
                        </li>

                        <?php endif; ?>

                    </ul>

                </div>

                <!-- END: Horizontal Menu -->


                <!-- BEGIN: Topbar -->
                <div id="m_header_topbar" class="m-topbar  m-stack m-stack--ver m-stack--general">
                    <div class="m-stack__item m-topbar__nav-wrapper">
                        <ul class="m-topbar__nav m-nav m-nav--inline">



                            <li class="m-nav__item m-topbar__notifications m-topbar__notifications--img m-dropdown m-dropdown--large m-dropdown--header-bg-fill m-dropdown--arrow m-dropdown--align-center 	m-dropdown--mobile-full-width"
                                m-dropdown-toggle="click" m-dropdown-persistent="1">
                                <a href="#" class="m-nav__link m-dropdown__toggle" id="m_topbar_notification_icon"
                                   data-toggle="m-tooltip" data-placement="top" title=""
                                   data-original-title="<?php echo e(trans('main.notifications')); ?>"
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
                                            <span class="m-dropdown__header-title"><?php echo e(trans('main.new')); ?> </span>
                                            <span class="m-dropdown__header-subtitle">
                                            <?php echo e(trans('main.notifications')); ?>

                                            </span>
                                        </div>
                                        <div class="m-dropdown__body">
                                            <div class="m-dropdown__content">
                                                <ul class="nav nav-tabs m-tabs m-tabs-line m-tabs-line--brand"
                                                    role="tablist">
                                               
                                                    <li class="nav-item m-tabs__item">
                                                        <a class="nav-link m-tabs__link " data-toggle="tab"
                                                           href="#topbar_notifications_notifications" role="tab" onclick="showajaxnotfication('notifications');">
                                                           <?php echo e(trans('main.notifications')); ?>

                                                        </a>
                                                    </li>

                                                    <li class="nav-item m-tabs__item">
                                                        <a class="nav-link m-tabs__link" data-toggle="tab"
                                                           href="#topbar_notifications_logs" role="tab" onclick="showajaxnotfication('logs');"><?php echo e(trans('main.logs')); ?>   </a>
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
                                                                <?php if(Auth()->user()->is_super_admin || Auth()->user()->can("notfications index")): ?>
                                                                <div class="more_btn">
                                                                    <a href="<?php echo route('notfications.index'); ?>"
                                                                       class="btn btn-secondary btn-sm"><?php echo e(trans("main.more_records")); ?></a>
                                                                </div>
                                                                <?php endif; ?>
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
                                                            <?php if(Auth()->user()->is_super_admin || Auth()->user()->can("logs index")): ?>
                                                            <div class="more_btn">
                                                                <a href="<?php echo url('logs'); ?>"
                                                                   class="btn btn-secondary btn-sm"><?php echo e(trans("main.more_records")); ?></a>
                                                            </div>
                                                            <?php endif; ?>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>




                            <li id="m_quick_sidebar_toggle" class="m-nav__item">
                                <a id="btnFullscreen" class="m-nav__link m-dropdown__toggle" data-toggle="m-tooltip"
                                   data-placement="top" title="" data-original-title="+/- <?php echo e(trans('main.display')); ?>">
                    				<span class="m-nav__link-icon">
                    					<i class="fa fa-th-large"></i>
                    				</span>
                                </a>
                            </li>

                            <li id="m_quick_sidebar_toggle" class="m-nav__item">
                                <a id="btnFullscreen" class="m-nav__link " title="<?php echo e(trans('main.'.App()->getLocale())); ?>" href="<?php echo e(url('lang')); ?>">
                                   <?php if(App()->getLocale() == 'ar'): ?>
                                   <span class="m-nav__link-icon"><i class="la la-language"></i></span>
                                    <?php else: ?>
                                    <span class="m-nav__link-icon"><i class="la la-language"></i></span>
                                    <?php endif; ?>

                                </a>
                            </li>
                            <li class="m-nav__item m-topbar__user-profile  m-dropdown m-dropdown--medium m-dropdown--arrow  m-dropdown--align-right m-dropdown--mobile-full-width m-dropdown--skin-light user_profile_btn"
                                m-dropdown-toggle="click">
                                <a href="#" class="m-nav__link m-dropdown__toggle" data-toggle="m-tooltip"
                                   data-placement="top" title="" data-original-title="<?php echo e(trans('main.profile')); ?>">
                                    <span class="m-topbar__userpic">
                                        <?php if(!empty(Auth::user()->image)): ?>
                                        <img src="<?php echo asset(Auth::user()->image); ?>"
                                             class="m--img-rounded m--marginless m--img-centered" alt=""/>

                                        <?php else: ?>
                                            <?php echo Auth()->user()->name; ?>

                                        <?php endif; ?>
                                    </span>

                                    <span
                                        class="m-topbar__username m--hide"><?php echo Auth()->user()->name; ?></span>
                                </a>
                                <div class="m-dropdown__wrapper">
                                    <span
                                        class="m-dropdown__arrow m-dropdown__arrow--right m-dropdown__arrow--adjust"></span>
                                    <div class="m-dropdown__inner">
                                        <div class="user_dropdown">
                                            <div class="m-card-user m-card-user--skin-dark">
                                                <div class="m-card-user__pic">
                                                    <img src="<?php echo asset(Auth::user()->image); ?>"
                                                         class="m--img-rounded m--marginless" alt=""/>
                                                </div>
                                                <div class="m-card-user__details">
                                                    <span
                                                        class="m-card-user__name m--font-weight-500"><?php echo Auth()->user()->name; ?></span>
                                                    <a href=""
                                                       class="m-card-user__email m--font-weight-300 m-link"><?php echo Auth()->user()->email; ?></a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="m-dropdown__body">
                                            <div class="m-dropdown__content">
                                                <a href="<?php echo e(url('profile')); ?>" class="user_profile_link">
                                                            <i class="fa fa-user"></i>
                                                            <span class="m-nav__link-title">
                                                                <span class="m-nav__link-wrap">
                                                                    <span class="m-nav__link-text">
                                                                        <?php echo e(trans('main.profile')); ?>

                                                                    </span>

                                                                </span>
                                                            </span>
                                                        </a>
                                                <?php echo e(Form::open(['route'=>'logout','method'=>'POST'])); ?>

                                                        <?php echo csrf_field(); ?>
                                                        <button class="base_btn logout_btn">
                                                            <i class="fa fa-sign-in-alt"></i>
                                                            <span><?php echo e(trans('main.logout')); ?></span>
                                                        </button>
                                                        <?php echo e(Form::close()); ?>

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
<?php /**PATH /var/www/html/invoices/resources/views/layouts/_navbar.blade.php ENDPATH**/ ?>