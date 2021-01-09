@extends('layouts.app')

@section('content')
<div class="show-top-grids">
    <div class="col-sm-12 single-left">
        <div class="" style="margin-top: -20px;">

            <div class="creators-grids">
                <div class="recommended-info">
                    <h3>Search results for: <small style="font-size: 16px">{{request()->query('search')}}</small> <span
                            style="margin-left: 30px" class="badge">{{$channels->count() + $videos->count()}}</span>
                        <small>results</small></h3>
                </div>
                {{-- @foreach ($channel->videos->groupBy('category_id') as $key => $videos) --}}
                @if ($channels->count() > 0)
                <div class="recommended" style="margin-top: 40px;">
                    <div class="recommended-info">
                        <h3 style="color:#8e8b8b">Channels: </h3>
                    </div>
                    @foreach ($channels->chunk(4) as $channelChunk)
                    <div class="recommended-grids" style="margin-top: 20px;">

                        @foreach ($channelChunk as $channel)
                        <div class="col-md-3 resent-grid recommended-grid">
                            <div class="media">
                                {{-- <h5>Peter Johnson</h5> --}}
                                <div class="media-left">
                                    <a href="{{route('channels.show', $channel->id)}}">
                                        @if ($channel->image_thumb())
                                        <img class="img-thumbnail img-circle" src="{{asset($channel->image_thumb())}}"
                                            alt="{{$channel->title}}">
                                        @endif
                                    </a>
                                </div>
                                <div class="media-body">
                                    <a href="{{route('channels.show', $channel->id)}}">
                                        <h1 style="font-size: 18px; color:#0076CC; margin-top:0px">{{$channel->title}}
                                        </h1>
                                    </a>
                                    <span style="float: left;" class="search-page-subscriber-btn">
                                        <subscriber-button :init-subscriptions="{{$channel->subscriptions}}"
                                            :channel="{{$channel}}">
                                        </subscriber-button>
                                    </span>
                                </div>
                            </div>
                        </div>
                        @endforeach
                        <div class="clearfix"> </div>
                    </div>
                    @endforeach
                </div>
                @endif

                @if ($videos->count() > 0)
                <div class="recommended" style="margin-top: 40px;">
                    <div class="recommended-info">
                        <h3 style="color:#8e8b8b">Videos : </h3>
                    </div>
                    @foreach ($videos->chunk(4) as $videoChunk)
                    <div class="recommended-grids" style="margin-top: 20px;">

                        @foreach ($videoChunk as $video)
                        <div class="col-md-3 resent-grid recommended-grid">
                            <div class="resent-grid-img recommended-grid-img">
                                <a href="{{route('videos.show', $video->id)}}"><img
                                        src="{{asset($video->thumbnail ?? 'images/c1.jpg')}}"
                                        alt="{{Str::title($video->title ?? 'No Title')}}" /></a>
                                <div class="time small-time">
                                    <p>7:30</p>
                                </div>
                                <div class="clck small-clck">
                                    <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                                </div>
                            </div>
                            <div class="resent-grid-info recommended-grid-info video-info-grid">
                                <h5><a href="{{route('videos.show', $video->id)}}"
                                        class="title">{{Str::title($video->title ?? 'No Title')}}</a>
                                </h5>
                                <ul>
                                    <li style="width:50%">
                                        <p class="author author-info"><a
                                                href="{{route('channels.show', $video->channel_id)}}"
                                                class="author">{{Str::limit($video->channel->title, 10) ?? 'New Channel'}}</a>
                                        </p>
                                    </li>
                                    <li style=" width: 22%">
                                        <p class="views views-info">
                                            <span aria-hidden="true" class="glyphicon glyphicon-comment"></span>
                                            {{$video->allcomments->count()}}
                                        </p>
                                    </li>
                                    <li class="right-list" style="width: 22%">
                                        <p class="views views-info">
                                            <span aria-hidden="true" class="glyphicon glyphicon-eye-open"></span>
                                            {{$video->views}}
                                        </p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        @endforeach
                        <div class="clearfix"> </div>
                    </div>
                    @endforeach
                </div>
                @endif
            </div>




        </div>
    </div>
    <div class="clearfix"> </div>
</div>

@endsection