@extends('layouts.app')

@section('content')
<div class="main-grids">
    @foreach ($topVideos->chunk(3) as $videoChunk)
    <div class="top-grids">
        @if ($loop->index == 0)
        <div class="recommended-info">
            <h3>Top Videos</h3>
        </div>
        @endif
        @foreach ($videoChunk as $video)
        <div class="col-md-4 resent-grid recommended-grid slider-top-grids" style="margin-top:20px">
            <div class="resent-grid-img recommended-grid-img">
                <a href="{{route('videos.show', $video->id)}}"><img
                        src="{{asset($video->thumbnail ?? 'images/c1.jpg')}}" alt="" /></a>
                <div class="time">
                    <p>3:04</p>
                </div>
                <div class="clck">
                    <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                </div>
            </div>
            <div class="resent-grid-info recommended-grid-info">
                <h3><a href="{{route('videos.show', $video->id)}}"
                        class="title title-info">{{Str::title($video->title ?? 'No Title')}}</a></h3>
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
                <ul>
                    <li>
                        <p class="author author-info"><a href="{{route('channels.show', $video->channel_id)}}"
                                class="author">{{Str::limit(Str::title($video->channel->title ?? 'No Title'), 20)}}</a>
                        </p>
                    </li>
                    <li class="right-list">
                        <p class="views views-info">{{$video->created_at->diffForHumans()}}</p>
                    </li>
                </ul>
            </div>
        </div>
        @endforeach
        <div class="clearfix"> </div>
    </div>
    @endforeach

    <div class="recommended">
        <div class="recommended-grids">
            <div class="recommended-info">
                <h3>Recommended for you</h3>
            </div>


            <videos></videos>


        </div>
    </div>

    {{-- <div class="recommended">
        <div>
            <infinit-scroll inline-template>
                <div class="ajax-load text-center">
                    <p><img src="{{asset('images/loading/Ripple-1s-200px.gif')}}"></p>
</div>
</infinit-scroll>
</div>
</div> --}}
</div>
@endsection