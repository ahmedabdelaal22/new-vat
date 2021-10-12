@foreach(notifications() as $row)
<div class="m-list-timeline__item">
<span
    class="m-list-timeline__badge -m-list-timeline__badge--state-success"></span>
    <a href="{{$row->link}}"
       class="m-list-timeline__text not_link">{{$row->body}}</a>
    <span
        class="m-list-timeline__time">{{$row->date}}</span>
</div>
@endforeach