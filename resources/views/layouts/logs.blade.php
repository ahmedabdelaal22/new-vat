@foreach(logsnave() as $resource)
<div class="m-list-timeline__item">
    <span class="m-list-timeline__badge -m-list-timeline__badge--state-success"></span>
    <a href="{{showGetUrlHelper($resource->url,$resource->auditable_type,$resource->auditable_id)}}"
        class="m-list-timeline__text not_link">{{showLoghelper($resource->auditable_type,$resource->event)}}</a>
    <span class="m-list-timeline__time">{!!$resource->created_at!!}</span>
</div>
@endforeach
