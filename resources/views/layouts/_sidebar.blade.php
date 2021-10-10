<button class="m-aside-left-close  m-aside-left-close--skin-dark " id="m_aside_left_close_btn"><i
        class="la la-close"></i></button>
<div id="m_aside_left" class="m-grid__item  m-aside-left  m-aside-left--skin-dark ">

    <!-- BEGIN: Aside Menu -->
    <div id="m_ver_menu" class="m-aside-menu  m-aside-menu--skin-dark m-aside-menu--submenu-skin-dark "
         m-menu-vertical="1" m-menu-scrollable="0" m-menu-dropdown-timeout="500">
        <ul class="m-menu__nav ">
            {{-- <li class="m-menu__section m-menu__section--first">
                 <h4 class="m-menu__section-text"></h4>
                 <i class="m-menu__section-icon flaticon-more-v2"></i>


             </li>--}}
            <li class="m-menu__item " aria-haspopup="true">
                <a href="{!!url('/')!!}" class="m-menu__link ">
                    <span class="m-menu__item-here"></span><i class="m-menu__link-icon fa fa-tachometer-alt"></i>
                    <span class="m-menu__link-text">
                    {{trans('main.dashboard')}}
                    </span></a>
            </li>

            @if(Auth()->user()->is_super_admin ||
                     Auth()->user()->can('departments index')||
                     Auth()->user()->can('users index')||
                     Auth()->user()->can('role_permissions index')||
                     Auth()->user()->can('roles index')
                     )
                <li class="m-menu__item  m-menu__item--submenu  @if(Request::is('departments*') || Request::is('users*') || Request::is('role_permissions*')|| Request::is('roles*')) m-menu__item--open @endif"
                    aria-haspopup="true" m-menu-submenu-toggle="hover"
                    m-menu-link-redirect="1">
                    <a href="javascript:;" class="m-menu__link m-menu__toggle">
                        <span class="m-menu__item-here"></span>
                        <i class="m-menu__link-icon fa fa-users"></i>
                        <span class="m-menu__link-title">
                        <span class="m-menu__link-wrap">
                          <span class="m-menu__link-text">{{trans('main.users_management')}}</span>
                           <span class="m-menu__link-badge">
                               <!-- <span class="m-badge m-badge--accent">  
                               </span> -->
                            </span>
                        </span>
                    </span>
                        <i class="m-menu__ver-arrow la la-angle-left"></i>
                    </a>
                    <div
                        class="m-menu__submenu @if(Request::is('departments') || Request::is('users') || Request::is('role_permissions')|| Request::is('roles')) m-menu__item--open @endif">
                        <span class="m-menu__arrow"></span>
                        <ul class="m-menu__subnav">
                            <li class="m-menu__item  m-menu__item--parent" aria-haspopup="true"
                                m-menu-link-redirect="1">
                            <span class="m-menu__link">
                                <span class="m-menu__item-here"></span>
                                <span class="m-menu__link-title">
                                    <span class="m-menu__link-wrap">
                                        <span class="m-menu__link-text">
                                            {{trans('main.users_management')}}
                                        </span>

                                    </span>
                                </span>
                            </span>
                            </li>

                            @if(Auth()->user()->is_super_admin || Auth()->user()->can('departments index'))

                                <li class="m-menu__item m-menu__item--open {{ (Request::is('departments*')) ? ' active ' : '' }} "
                                    aria-haspopup="true" m-menu-link-redirect="1">
                                    <a href="{!!route('departments.index')!!}" class="m-menu__link ">
                                        <i class="m-menu__link-bullet m-menu__link-bullet--line">
                                            <span></span>
                                        </i>
                                        <span class="m-menu__link-text">{{trans('main.departments')}}</span>
                                    </a>
                                </li>
                            @endif
                            @if(Auth()->user()->is_super_admin || Auth()->user()->can('users index'))

                                <li class="m-menu__item {{ (Request::is('users')) ? ' active ' : '' }}"
                                    aria-haspopup="true" m-menu-link-redirect="1">
                                    <a href="{!!route('users.index')!!}" class="m-menu__link ">
                                        <i class="m-menu__link-bullet m-menu__link-bullet--line">
                                            <span></span>
                                        </i>
                                        <span class="m-menu__link-text">{{trans('main.users')}}</span>
                                    </a>
                                </li>
                            @endif
                            <!-- @if(Auth()->user()->is_super_admin || Auth()->user()->can('users create'))
                                <li class="m-menu__item {{ (Request::is('users/create*')) ? ' active ' : '' }}"
                                    aria-haspopup="true" m-menu-link-redirect="1">
                                    <a href="{!!route('users.create')!!}" class="m-menu__link ">
                                        <i class="m-menu__link-bullet m-menu__link-bullet--line">
                                            <span></span>
                                        </i>
                                        <span class="m-menu__link-text">{{trans('main.add')}}</span>
                                    </a>
                                </li>
                            @endif -->
                            @if(Auth()->user()->is_super_admin || Auth()->user()->can('role_permissions index'))
                                <li class="m-menu__item {{ (Request::is('role_permissions*')) ? ' active ' : '' }}"
                                    aria-haspopup="true" m-menu-link-redirect="1">
                                    <a href="{!!route('role_permissions.index')!!}" class="m-menu__link ">
                                        <i class="m-menu__link-bullet m-menu__link-bullet--line">
                                            <span></span>
                                        </i>
                                        <span class="m-menu__link-text">
                                    {{trans('main.role_permissions')}}
                                </span>
                                    </a>
                                </li>
                            @endif
                            @if(Auth()->user()->is_super_admin || Auth()->user()->can('roles index'))
                                <li class="m-menu__item {{ (Request::is('roles*')) ? ' active ' : '' }}"
                                    aria-haspopup="true" m-menu-link-redirect="1">
                                    <a href="{!!route('roles.index')!!}" class="m-menu__link ">
                                        <i class="m-menu__link-bullet m-menu__link-bullet--line">
                                            <span></span>
                                        </i>
                                        <span class="m-menu__link-text">
                                    {{trans('main.roles')}}
                                </span>
                                    </a>
                                </li>
                            @endif
                        </ul>
                    </div>

                </li>

            @endif
            @if(Auth()->user()->is_super_admin ||
            Auth()->user()->can('clients index')||
            Auth()->user()->can('leads index')||
            Auth()->user()->can('contact list index')||
            Auth()->user()->can('sms messages index')
            )
                <li class="m-menu__item m-menu__item--submenu  @if(Request::is('clients*') || Request::is('contact list*')) m-menu__item--open @endif"
                    aria-haspopup="true" m-menu-submenu-toggle="hover"
                    m-menu-link-redirect="1">
                    <a href="javascript:;" class="m-menu__link m-menu__toggle">
                        <span class="m-menu__item-here"></span>
                        <i class="m-menu__link-icon fa fa-user-tie"></i>
                        <span class="m-menu__link-title">
                        <span class="m-menu__link-wrap">
                          <span class="m-menu__link-text">{{trans('main.clients_management')}}</span>
                           <span class="m-menu__link-badge">
                               <!-- <span class="m-badge m-badge--accent"> 
                               </span> -->
                            </span>
                        </span>
                    </span>
                        <i class="m-menu__ver-arrow la la-angle-left"></i>
                    </a>
                    <div class="m-menu__submenu  "><span class="m-menu__arrow"></span>
                        <ul class="m-menu__subnav">
                            <li class="m-menu__item  m-menu__item--parent" aria-haspopup="true"
                                m-menu-link-redirect="1">
                            <span class="m-menu__link">
                                <span class="m-menu__item-here"></span>
                                <span class="m-menu__link-title">
                                    <span class="m-menu__link-wrap">
                                        <span class="m-menu__link-text">
                                            {{trans('main.clients_management')}}
                                        </span>

                                    </span>
                                </span>
                            </span>
                            </li>
                            @if(Auth()->user()->is_super_admin || Auth()->user()->can('clients index'))
                                <li class="m-menu__item {{ (Request::is('clients')) ? ' active ' : '' }}"
                                    aria-haspopup="true" m-menu-link-redirect="1">
                                    <a href="{!!route('clients.index')!!}" class="m-menu__link ">
                                        <i class="m-menu__link-bullet m-menu__link-bullet--line">
                                            <span></span>
                                        </i>
                                        <span class="m-menu__link-text">{{trans('main.clients')}}</span>
                                    </a>
                                </li>
                            @endif
           
                  
                        </ul>
                    </div>

                </li>
            @endif


            @if(Auth()->user()->is_super_admin ||
           Auth()->user()->can('inventories index')||
           Auth()->user()->can('item categories index')||
           Auth()->user()->can('items index')||
           Auth()->user()->can('inventory items index') 

           )
                <li class="m-menu__item  m-menu__item--submenu  @if(Request::is('inventories*') || Request::is('item_categories*') || Request::is('items*')|| Request::is('inventory_items*')) m-menu__item--open @endif"
                    aria-haspopup="true" m-menu-submenu-toggle="hover"
                    m-menu-link-redirect="1">
                    <a href="javascript:;" class="m-menu__link m-menu__toggle">
                        <span class="m-menu__item-here"></span>
                        <i class="m-menu__link-icon fa fa-server"></i>
                        <span class="m-menu__link-title">
                        <span class="m-menu__link-wrap">
                          <span class="m-menu__link-text">{{trans('main.inventories_management')}}</span>
                           <span class="m-menu__link-badge">
                               <!-- <span class="m-badge m-badge--accent">  
                               </span> -->
                            </span>
                        </span>
                    </span>
                        <i class="m-menu__ver-arrow la la-angle-left"></i>
                    </a>
                    <div class="m-menu__submenu "><span class="m-menu__arrow"></span>
                        <ul class="m-menu__subnav">
                            <li class="m-menu__item  m-menu__item--parent" aria-haspopup="true"
                                m-menu-link-redirect="1">
                            <span class="m-menu__link">
                                <span class="m-menu__item-here"></span>
                                <span class="m-menu__link-title">
                                    <span class="m-menu__link-wrap">
                                        <span class="m-menu__link-text">
                                            {{trans('main.inventories_management')}}
                                        </span>

                                    </span>
                                </span>
                            </span>
                            </li>
                            @if(Auth()->user()->is_super_admin || Auth()->user()->can('inventories index'))
                                <li class="m-menu__item {{ (Request::is('inventories')) ? ' active ' : '' }}"
                                    aria-haspopup="true" m-menu-link-redirect="1">
                                    <a href="{!!route('inventories.index')!!}" class="m-menu__link ">
                                        <i class="m-menu__link-bullet m-menu__link-bullet--line">
                                            <span></span>
                                        </i>
                                        <span class="m-menu__link-text">{{trans('main.inventories')}}</span>
                                    </a>
                                </li>
                            @endif
                          
                            @if(Auth()->user()->is_super_admin || Auth()->user()->can('item categories index'))
                                <li class="m-menu__item {{ (Request::is('item_categories*')) ? ' active ' : '' }}"
                                    aria-haspopup="true" m-menu-link-redirect="1">
                                    <a href="{!!route('item_categories.index')!!}" class="m-menu__link ">
                                        <i class="m-menu__link-bullet m-menu__link-bullet--line">
                                            <span></span>
                                        </i>
                                        <span class="m-menu__link-text">{{trans('main.item_categories')}}</span>
                                    </a>
                                </li>
                            @endif
                            @if(Auth()->user()->is_super_admin || Auth()->user()->can('items index'))
                                <li class="m-menu__item {{ (Request::is('items*')) ? ' active ' : '' }}"
                                    aria-haspopup="true" m-menu-link-redirect="1">
                                    <a href="{!!route('items.index')!!}" class="m-menu__link ">
                                        <i class="m-menu__link-bullet m-menu__link-bullet--line">
                                            <span></span>
                                        </i>
                                        <span class="m-menu__link-text">{{trans('main.items')}}</span>
                                    </a>
                                </li>
                            @endif
                            @if(Auth()->user()->is_super_admin || Auth()->user()->can('inventory items index'))
                                <li class="m-menu__item {{ (Request::is('inventory_items*')) ? ' active ' : '' }}"
                                    aria-haspopup="true" m-menu-link-redirect="1">
                                    <a href="{!!route('inventory_items.index')!!}" class="m-menu__link ">
                                        <i class="m-menu__link-bullet m-menu__link-bullet--line">
                                            <span></span>
                                        </i>
                                        <span class="m-menu__link-text">{{trans('main.inventory_items')}}</span>
                                    </a>
                                </li>
                            @endif


                        </ul>
                    </div>

                </li>
            @endif

            @if(Auth()->user()->is_super_admin ||
                     Auth()->user()->can('sales order index')||
                     Auth()->user()->can('sales invoices index')
                     )
                <li class="m-menu__item  m-menu__item--submenu @if(Request::is('sales_order*') || Request::is('invoicesdk*') || Request::is('sales_invoices*')) m-menu__item--open @endif"
                    aria-haspopup="true" m-menu-submenu-toggle="hover"
                    m-menu-link-redirect="1">
                    <a href="javascript:;" class="m-menu__link m-menu__toggle">
                        <span class="m-menu__item-here"></span>
                        <i class="m-menu__link-icon fa fa-shopping-cart"></i>
                        <span class="m-menu__link-title">
                        <span class="m-menu__link-wrap">
                          <span class="m-menu__link-text">{{trans('main.sales_administration')}}</span>
                           <span class="m-menu__link-badge">
                               <!-- <span class="m-badge m-badge--accent">  
                               </span> -->
                            </span>
                        </span>
                    </span>
                        <i class="m-menu__ver-arrow la la-angle-left"></i>
                    </a>
                    <div class="m-menu__submenu "><span class="m-menu__arrow"></span>
                        <ul class="m-menu__subnav">
                            <li class="m-menu__item  m-menu__item--parent" aria-haspopup="true"
                                m-menu-link-redirect="1">
                            <span class="m-menu__link">
                                <span class="m-menu__item-here"></span>
                                <span class="m-menu__link-title">
                                    <span class="m-menu__link-wrap">
                                        <span class="m-menu__link-text">
                                            {{trans('main.sales_administration')}}
                                        </span>

                                    </span>
                                </span>
                            </span>
                            </li>
                            @if(Auth()->user()->is_super_admin || Auth()->user()->can('sales order index'))

                                <li class="m-menu__item {{ (Request::is('sales_order*')) ? ' active ' : '' }}"
                                    aria-haspopup="true" m-menu-link-redirect="1">

                                    <a href="{!!route('sales_order.index')!!}" class="m-menu__link ">
                                        <i class="m-menu__link-bullet m-menu__link-bullet--line">
                                            <span></span>
                                        </i>
                                        <span class="m-menu__link-text">{{trans('main.sales_order')}}</span>
                                    </a>
                                </li>
                            @endif
                            @if(Auth()->user()->is_super_admin || Auth()->user()->can('sales invoices index'))

                                <li class="m-menu__item {{ (Request::is('sales_invoices')) ? ' active ' : '' }}"
                                    aria-haspopup="true" m-menu-link-redirect="1">
                                    <a href="{!!route('sales_invoices.index')!!}" class="m-menu__link ">
                                        <i class="m-menu__link-bullet m-menu__link-bullet--line">
                                            <span></span>
                                        </i>
                                        <span class="m-menu__link-text">{{trans('main.sales_invoices')}}</span>
                                    </a>
                                </li>
                            @endif
                            @if(!empty(session('generatedAccessToken')))
                            <li class="m-menu__item {{ (Request::is('invoicesdk')) ? ' active ' : '' }}"
                                    aria-haspopup="true" m-menu-link-redirect="1">
                                    <a href="{!!route('invoicesdk')!!}" class="m-menu__link ">
                                        <i class="m-menu__link-bullet m-menu__link-bullet--line">
                                            <span></span>
                                        </i>
                                        <span class="m-menu__link-text">{{trans('main.invoicesdk')}}</span>
                                    </a>
                                </li>
                           @endif


                            
                            @if(Auth()->user()->is_super_admin || Auth()->user()->can('sales invoices installments index'))
                                <li class="m-menu__item {{ (Request::is('sales_invoices_installments*')) ? ' active ' : '' }}"
                                    aria-haspopup="true" m-menu-link-redirect="1">
                                    <a href="{!!route('sales_invoices_installments.index')!!}" class="m-menu__link ">
                                        <i class="m-menu__link-bullet m-menu__link-bullet--line">
                                            <span></span>
                                        </i>
                                        <span
                                            class="m-menu__link-text">{{trans('main.sales_invoices_installments')}}</span>
                                    </a>
                                </li>
                            @endif

                        </ul>
                    </div>

                </li>
            @endif
            @if(Auth()->user()->is_super_admin ||
                     Auth()->user()->can('suppliers index')||
                     Auth()->user()->can('purchase invoices index')||
                     Auth()->user()->can('purchase installments index')||
                     Auth()->user()->can('payments index')
                     )
                <li class="m-menu__item  m-menu__item--submenu @if(Request::is('suppliers*') || Request::is('purchase_invoices*') || Request::is('purchase_installments*')|| Request::is('payments*')) m-menu__item--open @endif"
                    aria-haspopup="true" m-menu-submenu-toggle="hover"
                    m-menu-link-redirect="1">
                    <a href="javascript:;" class="m-menu__link m-menu__toggle">
                        <span class="m-menu__item-here"></span>
                        <i class="m-menu__link-icon fa fa-money-check-alt"></i>
                        <span class="m-menu__link-title">
                        <span class="m-menu__link-wrap">
                          <span class="m-menu__link-text">{{trans('main.purchase_management')}}</span>
                           <span class="m-menu__link-badge">
                               <!-- <span class="m-badge m-badge--accent"> 
                               </span> -->
                            </span>
                        </span>
                    </span>
                        <i class="m-menu__ver-arrow la la-angle-left"></i>
                    </a>
                    <div class="m-menu__submenu "><span class="m-menu__arrow"></span>
                        <ul class="m-menu__subnav">
                            <li class="m-menu__item  m-menu__item--parent" aria-haspopup="true"
                                m-menu-link-redirect="1">
                            <span class="m-menu__link">
                                <span class="m-menu__item-here"></span>
                                <span class="m-menu__link-title">
                                    <span class="m-menu__link-wrap">
                                        <span class="m-menu__link-text">
                                            {{trans('main.purchase_management')}}
                                        </span>

                                    </span>
                                </span>
                            </span>
                            </li>
                            @if(Auth()->user()->is_super_admin || Auth()->user()->can('suppliers index'))
                                <li class="m-menu__item {{ (Request::is('suppliers*')) ? ' active ' : '' }}"
                                    aria-haspopup="true" m-menu-link-redirect="1">
                                    <a href="{!!route('suppliers.index')!!}" class="m-menu__link ">
                                        <i class="m-menu__link-bullet m-menu__link-bullet--line">
                                            <span></span>
                                        </i>
                                        <span class="m-menu__link-text">{{trans('main.suppliers')}}</span>
                                    </a>
                                </li>
                            @endif
                            @if(Auth()->user()->is_super_admin || Auth()->user()->can('purchase invoices index'))
                                <li class="m-menu__item {{ (Request::is('purchase_invoices*')) ? ' active ' : '' }}"
                                    aria-haspopup="true" m-menu-link-redirect="1">
                                    <a href="{!!route('purchase_invoices.index')!!}" class="m-menu__link ">
                                        <i class="m-menu__link-bullet m-menu__link-bullet--line">
                                            <span></span>
                                        </i>
                                        <span class="m-menu__link-text">{{trans('main.purchase_invoices')}}</span>
                                    </a>
                                </li>
                            @endif
                            @if(Auth()->user()->is_super_admin || Auth()->user()->can('purchase installments index'))
                                <li class="m-menu__item {{ (Request::is('purchase_installments*')) ? ' active ' : '' }}"
                                    aria-haspopup="true" m-menu-link-redirect="1">

                                    <a href="{!!route('purchase_installments.index')!!}" class="m-menu__link ">
                                        <i class="m-menu__link-bullet m-menu__link-bullet--line">
                                            <span></span>
                                        </i>
                                        <span class="m-menu__link-text">{{trans('main.purchase_installments')}}</span>
                                    </a>
                                </li>
                            @endif
                     
                        </ul>
                    </div>

                </li>
            @endif
            @if(Auth()->user()->is_super_admin ||
                     Auth()->user()->can('settings index')||
                     Auth()->user()->can('leads statuses index')||
                     Auth()->user()->can('connection ways index')||
                     Auth()->user()->can('notfications index')||
                     Auth()->user()->can('client categories index')
                     )
                <li class="m-menu__item  m-menu__item--submenu @if( Request::is('client_categories*') || Request::is('notfications*') || Request::is('settings*')) m-menu__item--open @endif"
                    aria-haspopup="true" m-menu-submenu-toggle="hover"
                    m-menu-link-redirect="1">
                    <a href="javascript:;" class="m-menu__link m-menu__toggle">
                        <span class="m-menu__item-here"></span>
                        <i class="m-menu__link-icon fa fa-cog"></i>
                        <span class="m-menu__link-title">
                        <span class="m-menu__link-wrap">
                          <span class="m-menu__link-text">{{trans('main.settings')}}</span>
                           <span class="m-menu__link-badge">
                               <!-- <span class="m-badge m-badge--accent">  
                               </span> -->
                            </span>
                        </span>
                    </span>
                        <i class="m-menu__ver-arrow la la-angle-left"></i>
                    </a>
                    <div class="m-menu__submenu "><span class="m-menu__arrow"></span>
                        <ul class="m-menu__subnav">
                            <li class="m-menu__item  m-menu__item--parent" aria-haspopup="true"
                                m-menu-link-redirect="1">
                            <span class="m-menu__link">
                                <span class="m-menu__item-here"></span>
                                <span class="m-menu__link-title">
                                    <span class="m-menu__link-wrap">
                                        <span class="m-menu__link-text">
                                            {{trans('main.settings')}}
                                        </span>

                                    </span>
                                </span>
                            </span>
                            </li>
           
                          
                            @if(Auth()->user()->is_super_admin || Auth()->user()->can('client categories index'))
                                <li class="m-menu__item {{ (Request::is('client_categories*')) ? ' active ' : '' }}"
                                    aria-haspopup="true" m-menu-link-redirect="1">
                                    <a href="{!!route('client_categories.index')!!}" class="m-menu__link ">
                                        <i class="m-menu__link-bullet m-menu__link-bullet--line">
                                            <span></span>
                                        </i>
                                        <span class="m-menu__link-text">{{trans('main.client_categories')}}</span>
                                    </a>
                                </li>
                            @endif
                            @if(Auth()->user()->is_super_admin || Auth()->user()->can('notfications index'))
                                <li class="m-menu__item {{ (Request::is('notfications*')) ? ' active ' : '' }}"
                                    aria-haspopup="true" m-menu-link-redirect="1">
                                    <a href="{!!route('notfications.index')!!}" class="m-menu__link ">
                                        <i class="m-menu__link-bullet m-menu__link-bullet--line">
                                            <span></span>
                                        </i>
                                        <span class="m-menu__link-text">{{trans('main.notfications')}}</span>
                                    </a>
                                </li>
                            @endif
                            @if(Auth()->user()->is_super_admin || Auth()->user()->can('settings index'))
                                <li class="m-menu__item {{ (Request::is('settings*')) ? ' active ' : '' }}"
                                    aria-haspopup="true" m-menu-link-redirect="1">
                                    <a href="{!!route('settings.index')!!}" class="m-menu__link ">
                                        <i class="m-menu__link-bullet m-menu__link-bullet--line">
                                            <span></span>
                                        </i>
                                        <span class="m-menu__link-text">{{trans('main.settings')}}</span>
                                    </a>
                                </li>
                            @endif
                        </ul>
                    </div>

                </li>
            @endif
            @if(Auth()->user()->is_super_admin ||
                   Auth()->user()->can('logs index')
                   )
                <li class="m-menu__item  m-menu__item--submenu @if(Request::is('logs*')) m-menu__item--open @endif"
                    aria-haspopup="true" m-menu-submenu-toggle="hover"
                    m-menu-link-redirect="1">
                    <a href="javascript:;" class="m-menu__link m-menu__toggle">
                        <span class="m-menu__item-here"></span>
                        <i class="m-menu__link-icon fa fa-file-alt"></i>
                        <span class="m-menu__link-title">
                        <span class="m-menu__link-wrap">
                          <span class="m-menu__link-text">{{trans('main.logs')}}</span>
                           <span class="m-menu__link-badge">
                               <!-- <span class="m-badge m-badge--accent">  
                               </span> -->
                            </span>
                        </span>
                    </span>
                        <i class="m-menu__ver-arrow la la-angle-left"></i>
                    </a>
                    <div class="m-menu__submenu "><span class="m-menu__arrow"></span>
                        <ul class="m-menu__subnav">
                            <li class="m-menu__item  m-menu__item--parent" aria-haspopup="true"
                                m-menu-link-redirect="1">
                            <span class="m-menu__link">
                                <span class="m-menu__item-here"></span>
                                <span class="m-menu__link-title">
                                    <span class="m-menu__link-wrap">
                                        <span class="m-menu__link-text">
                                            {{trans('main.logs')}}
                                        </span>

                                    </span>
                                </span>
                            </span>
                            </li>
                            <li class="m-menu__item {{ (Request::is('logs*')) ? ' active ' : '' }} "
                                aria-haspopup="true" m-menu-link-redirect="1">
                                <a href="{!!url('logs')!!}" class="m-menu__link ">
                                    <i class="m-menu__link-bullet m-menu__link-bullet--line">
                                        <span></span>
                                    </i>
                                    <span class="m-menu__link-text">{{trans('main.logs')}}</span>
                                </a>
                            </li>
                        </ul>
                    </div>

                </li>
            @endif
            {{--inventories--}}
         
            @if(Auth()->user()->is_super_admin ||
                     Auth()->user()->can('reports/clients leads index') ||
                     Auth()->user()->can('reports/client sales order index') ||
                     Auth()->user()->can('reports/client balances index')||
                     Auth()->user()->can('reports/deals index')||
                     Auth()->user()->can('reports/stock receipt report index')||
                     Auth()->user()->can('reports/stock ageing report index')||
                     Auth()->user()->can('reports/lead operations index')
                     )

            <li class="m-menu__item  m-menu__item--submenu @if(Request::is('reports*')) m-menu__item--open @endif"
                aria-haspopup="true" m-menu-submenu-toggle="hover"
                m-menu-link-redirect="1">
                <a href="javascript:;" class="m-menu__link m-menu__toggle">
                    <span class="m-menu__item-here"></span>
                    <i class="m-menu__link-icon fa fa-history"></i>
                    <span class="m-menu__link-title">
                        <span class="m-menu__link-wrap">
                          <span class="m-menu__link-text">{{trans('main.reports')}}</span>
                           <span class="m-menu__link-badge">
                               <!-- <span class="m-badge m-badge--accent">  
                               </span> -->
                            </span>
                        </span>
                    </span>
                    <i class="m-menu__ver-arrow la la-angle-left"></i>
                </a>
                <div class="m-menu__submenu "><span class="m-menu__arrow"></span>
                    <ul class="m-menu__subnav">
                        <li class="m-menu__item  m-menu__item--parent" aria-haspopup="true"
                            m-menu-link-redirect="1">
                            <span class="m-menu__link">
                                <span class="m-menu__item-here"></span>
                                <span class="m-menu__link-title">
                                    <span class="m-menu__link-wrap">
                                        <span class="m-menu__link-text">
                                            {{trans('main.reports')}}
                                        </span>

                                    </span>
                                </span>
                            </span>
                        </li>
 
          
                 
                        @if(Auth()->user()->is_super_admin ||
                     Auth()->user()->can('reports/client sales order index') 
                     )
                        <li class="m-menu__item {{ (Request::is('reports/client_sales_order*')) ? ' active ' : '' }} "
 
                            aria-haspopup="true" m-menu-link-redirect="1">
                            <a href="{!!url('reports/client_sales_order')!!}" class="m-menu__link ">
                                <i class="m-menu__link-bullet m-menu__link-bullet--line">
                                    <span></span>
                                </i>
                                <span class="m-menu__link-text">{{trans('main.reports/client_sales_order')}}</span>
                            </a>
                        </li>
 
                        <li class="m-menu__item {{ (Request::is('reports/client_sales_invoice')) ? ' active ' : '' }} "
 
                        @endif
                        @if(Auth()->user()->is_super_admin || Auth()->user()->can('reports/client sales invoice index')  )
                        <li class="m-menu__item {{ (Request::is('reports/client_sales_invoice*')) ? ' active ' : '' }}  "
 
                            aria-haspopup="true" m-menu-link-redirect="1">
                            <a href="{!!url('reports/client_sales_invoice')!!}" class="m-menu__link ">
                                <i class="m-menu__link-bullet m-menu__link-bullet--line">
                                    <span></span>
                                </i>
                                <span class="m-menu__link-text">{{trans('main.reports/client_sales_invoice')}}</span>
                            </a>
                        </li>
 
                        <li class="m-menu__item {{ (Request::is('reports/client_balances')) ? ' active ' : '' }} "
 
                        @endif


                        @if(Auth()->user()->is_super_admin ||
                     Auth()->user()->can('reports/client balances index')
                     )
                        <li class="m-menu__item {{ (Request::is('reports/client_balances*')) ? ' active ' : '' }} "
 
                            aria-haspopup="true" m-menu-link-redirect="1">
                            <a href="{!!url('reports/client_balances')!!}" class="m-menu__link ">
                                <i class="m-menu__link-bullet m-menu__link-bullet--line">
                                    <span></span>
                                </i>
                                <span class="m-menu__link-text">{{trans('main.reports/client_balances')}}</span>
                            </a>
                        </li>
 
 
                        @endif
       
                
 
                     
                        @if(Auth()->user()->is_super_admin ||
                     Auth()->user()->can('reports/stock receipt report index')
                     )
                        <li class="m-menu__item {{ (Request::is('reports/stock_receipt_report*')) ? ' active ' : '' }} "
 
                            aria-haspopup="true" m-menu-link-redirect="1">
                            <a href="{!!url('reports/stock_receipt_report')!!}" class="m-menu__link ">
                                <i class="m-menu__link-bullet m-menu__link-bullet--line">
                                    <span></span>
                                </i>
                                <span class="m-menu__link-text">{{trans('main.reports/stock_receipt_report')}}</span>
                            </a>
                        </li>
 
                        <li class="m-menu__item {{ (Request::is('reports/stock_ageing_report')) ? ' active ' : '' }} "
 
                        @endif
                        @if(Auth()->user()->is_super_admin ||
                     Auth()->user()->can('reports/stock ageing report index')
                     )
                        <li class="m-menu__item {{ (Request::is('reports/stock_ageing_report*')) ? ' active ' : '' }} "
 
                            aria-haspopup="true" m-menu-link-redirect="1">
                            <a href="{!!url('reports/stock_ageing_report')!!}" class="m-menu__link ">
                                <i class="m-menu__link-bullet m-menu__link-bullet--line">
                                    <span></span>
                                </i>
                                <span class="m-menu__link-text">{{trans('main.reports/stock_ageing_report')}}</span>
                            </a>
                        </li>
                     @endif

                    </ul>
                </div>

            </li>
            @endif

        </ul>
    </div>
    <!-- END: Aside Menu -->
</div>
