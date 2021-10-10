@extends('layouts.app')
@section('title')@endsection
@section('header')@endsection
@section('breadcrumb')
@php($breadcrumbs=['App Users'=>'/users','Add New'=>'/users/create'])
@includeWhen(isset($breadcrumbs),'layouts._breadcrumb', ['breadcrumbs' =>$breadcrumbs ])
@endsection
@section('content')@endsection
@section('scripts')@endsection
