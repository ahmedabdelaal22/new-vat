<!DOCTYPE html>
<html {{(app()->getLocale() == 'ar') ? ' lang="ar" dir="ltr" ' :  ' lang="en" dir="ltr" ' }}>
<!-- begin::Head -->
<head>
    <meta charset="utf-8"/>
    <title> {{trans('main.invoices')}} ||@yield('title')</title>
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta name="description" content="Blank inner page examples">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <!--begin::Web font -->
    @include('layouts.styles')
</head>
</head>
<!-- end::Head -->
<!-- begin::Body -->
<body class="m--skin- m-header--fixed m-header--fixed-mobile m-aside-left--enabled m-aside-left--skin-dark m-aside-left--fixed m-aside-left--offcanvas m-footer--push m-aside--offcanvas-default">
<!-- begin:: Page -->
<div class="m-grid m-grid--hor m-grid--root m-page">
            <div class="m-grid__item m-grid__item--fluid m-grid m-grid--ver-desktop m-grid--desktop m-grid--tablet-and-mobile m-grid--hor-tablet-and-mobile m-login m-login--1 m-login--signin" id="m_login">
                <div class="m-grid__item m-grid__item--order-tablet-and-mobile-2 m-login__aside">
                    <div class="m-stack m-stack--hor m-stack--desktop">
                        <div class="m-stack__item m-stack__item--fluid">
                            <div class="m-login__wrapper">
                                <div class="m-login__logo">
                                    <a href="#">
                                        <img class="logo_img login_logo" src="{!!url('dashboard')!!}/images/tanzem_logo.png">
                                    </a>
                                </div>
                                <div class="m-login__signin">
                                    <div class="m-login__head">
                                        <h3 class="m-login__title">{{trans('main.login')}}</h3>
                                    </div>
                                    @if(session()->has('error'))
                                        <div class="alert alert-danger">
                                            {{session()->get('error')}}
                                        </div>
                                    @endif
                                    <form class="m-login__form m-form" method="POST" action="{{ route('login') }}">
                        @csrf

                        <div class="form-group m-form__group">
                            <input class="form-control m-input" type="text" value="{{ old('email') }}"
                                   placeholder="{{trans('main.email')}}" name="email" autocomplete="off">
                            @if ($errors->has('email'))
                                <span class="invalid-feedback" role="alert" style="display:block !important">
                                        <strong>{{ $errors->first('email') }}</strong>
                                    </span>
                            @endif

                        </div>
                        <div class="form-group m-form__group">
                            <input class="form-control m-input m-login__form-input--last" type="password"
                                   placeholder="{{trans('main.password')}}" name="password" required autocomplete="off">
                            @if ($errors->has('password'))
                                <span class="invalid-feedback" role="alert" style="display:block !important">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                            @endif

                        </div>
                        <div class="row m-login__form-sub">
                            <div class=" m--align-left m-login__form-left">
                                <label class="m-checkbox  m-checkbox--focus">
                                    <input type="checkbox" name="remember" {{ old('remember') ? 'checked' : '' }}>
                                    {{trans('main.remember_me')}}
                                    <span></span>
                                </label>
                            </div>
                        </div>
                        <div class="m-login__form-action">
                            <button type="submit"
                                    {{-- id="m_login_signin_submit" --}} class="btn btn-focus m-btn m-btn--pill m-btn--custom m-btn--air  m-login__btn m-login__btn--primary login_btn">
                                {{trans('main.login')}}
                            </button>
                        </div>
                    </form>
                                </div>
                                <div class="m-login__signup">
                                    <div class="m-login__head">
                                        <h3 class="m-login__title">Sign Up</h3>
                                        <div class="m-login__desc">Enter your details to create your account:</div>
                                    </div>
                                    <form class="m-login__form m-form" action="">
                                        <div class="form-group m-form__group">
                                            <input class="form-control m-input" type="text" placeholder="Fullname" name="fullname">
                                        </div>
                                        <div class="form-group m-form__group">
                                            <input class="form-control m-input" type="text" placeholder="Email" name="email" autocomplete="off">
                                        </div>
                                        <div class="form-group m-form__group">
                                            <input class="form-control m-input" type="password" placeholder="Password" name="password">
                                        </div>
                                        <div class="form-group m-form__group">
                                            <input class="form-control m-input m-login__form-input--last" type="password" placeholder="Confirm Password" name="rpassword">
                                        </div>
                                        <div class="row form-group m-form__group m-login__form-sub">
                                            <div class="col m--align-left">
                                                <label class="m-checkbox m-checkbox--focus">
                                                    <input type="checkbox" name="agree"> I Agree the <a href="#" class="m-link m-link--focus">terms and conditions</a>.
                                                    <span></span>
                                                </label>
                                                <span class="m-form__help"></span>
                                            </div>
                                        </div>
                                        <div class="m-login__form-action">
                                            <button id="m_login_signup_submit" class="btn btn-focus m-btn m-btn--pill m-btn--custom m-btn--air">Sign Up</button>
                                            <button id="m_login_signup_cancel" class="btn btn-outline-focus  m-btn m-btn--pill m-btn--custom">Cancel</button>
                                        </div>
                                    </form>
                                </div>
                                <div class="m-login__forget-password">
                                    <div class="m-login__head">
                                        <h3 class="m-login__title">Forgotten Password ?</h3>
                                        <div class="m-login__desc">Enter your email to reset your password:</div>
                                    </div>
                                    <form class="m-login__form m-form" action="">
                                        <div class="form-group m-form__group">
                                            <input class="form-control m-input" type="text" placeholder="Email" name="email" id="m_email" autocomplete="off">
                                        </div>
                                        <div class="m-login__form-action">
                                            <button id="m_login_forget_password_submit" class="btn btn-focus m-btn m-btn--pill m-btn--custom m-btn--air">Request</button>
                                            <button id="m_login_forget_password_cancel" class="btn btn-outline-focus m-btn m-btn--pill m-btn--custom">Cancel</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="m-stack__item m-stack__item--center">
                            <div class="m-login__account">
                                <span class="m-login__account-msg">
                                    Tanzem © Queen Tech Solutions 2020
                                </span>&nbsp;&nbsp;
                            </div>
                        </div>
                    </div>
                </div>
                <div class="m-grid__item m-grid__item--fluid m-grid m-grid--center m-grid--hor m-grid__item--order-tablet-and-mobile-1  m-login__content m-grid-item--center" style="background-image: url({!!url('dashboard')!!}/images/login_pg.jpg)">
                    <div class="m-grid__item">
                        <h3 class="m-login__welcome">Join Our Community</h3>
                        <p class="m-login__msg">
                            Lorem ipsum dolor sit amet, coectetuer adipiscing<br>elit sed diam nonummy et nibh euismod
                        </p>
                    </div>
                </div>
            </div>
        </div>

@include('layouts.scripts')

</body>
<!-- end::Body -->
</html>