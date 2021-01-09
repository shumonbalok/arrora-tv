{{-- @endif --}}
@foreach ($videos as $cKey => $video)

{{-- @foreach ($videoChunk as $video) --}}
<div class="col-md-3 resent-grid recommended-grid" style="margin-top: 25px">
    <div class="resent-grid-img recommended-grid-img">
        <a href="{{route('videos.show', $video->id)}}"><img src="{{asset($video->thumbnail ?? 'images/c1.jpg')}}"
                alt="{{Str::title($video->title ?? 'No Title')}}" /></a>
        <div class="time small-time">
            <p>7:30</p>
        </div>
        <div class="clck small-clck">
            <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
        </div>
    </div>
    <div class="resent-grid-info recommended-grid-info video-info-grid">
        <h5><a href="{{route('videos.show', $video->id)}}" class="title">{{Str::title($video->title ?? 'No Title')}}</a>
        </h5>
        <ul>
            <li>
                <p class="author author-info"><a href="#"
                        class="author">{{Str::limit(Str::title($video->channel->title ?? 'No Title'), 10)}}</a>
                </p>
            </li>
            <li class="right-list">
                <p class="views views-info">{{$video->created_at->diffForHumans()}}</p>
            </li>
        </ul>
        <ul>
            <li>
                <p class="author author-info">
                    <vote :init_votes="{{$video->votes}}" entity_owner="{{$video->channel->user_id}}"
                        url="{{'/videos/'. $video->id . '/vote'}}"></vote>

                </p>
                {{-- <p class="author author-info"><a href="#" class="author">John Maniya</a></p> --}}
            </li>
            <li style="width: 24%">
                <p class="views views-info">
                    <span aria-hidden="true" class="glyphicon glyphicon-comment"></span>
                    {{$video->allcomments->count()}}
                </p>
            </li>
            <li class="right-list" style="width: 24%">
                <p class="views views-info">
                    <span aria-hidden="true" class="glyphicon glyphicon-eye-open"></span>
                    {{$video->views}}
                </p>
            </li>
        </ul>

    </div>
</div>
{{-- @endforeach --}}
@endforeach