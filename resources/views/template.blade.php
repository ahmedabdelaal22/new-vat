@extends('admin.layouts.app')
@section('title')@endsection
@section('header')@endsection
@section('breadcrumb')
@php($breadcrumbs=['الاعضاء'=>'/users','اضافه'=>'/users/create'])
@includeWhen(isset($breadcrumbs),'admin.layouts._breadcrumb', ['breadcrumbs' =>$breadcrumbs ])
@endsection
@section('content')@endsection
@section('scripts')@endsection
