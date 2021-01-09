@extends('layouts.app')

@section('content')
<div class="show-top-grids">
    <div class="col-sm-12 single-left">
        <div class="" style="margin-top: -20px;">

            <div class="creators-grids">
                <div class="recommended-info">
                    <h3>Histories: <small style="font-size: 16px"></small> <span style="margin-left: 30px"
                            class="badge">{{$histories->count()}}</span>
                        <small>results</small></h3>
                </div>


                @if ($histories->count() > 0)
                <div class="recommended" style="margin-top: 40px;">
                    <div class="recommended-info">
                        <h3 style="color:#8e8b8b">Videos : </h3>
                    </div>
                    @foreach ($histories->chunk(4) as $historyChunk)
                    <div class="recommended-grids" style="margin-top: 20px;">

                        @foreach ($historyChunk as $history)
                        <div class="col-md-3 resent-grid recommended-grid">
                            <div class="resent-grid-img recommended-grid-img">
                                <a href="{{route('videos.show', $history->video->id)}}"><img
                                        src="{{asset($history->video->thumbnail ?? 'images/c1.jpg')}}"
                                        alt="{{Str::title($history->video->title ?? 'No Title')}}" /></a>
                                <div class="time small-time">
                                    <p>7:30</p>
                                </div>
                                <div class="clck small-clck">
                                    <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                                </div>
                            </div>
                            <div class="resent-grid-info recommended-grid-info video-info-grid">
                                <h5><a href="{{route('videos.show', $history->video->id)}}"
                                        class="title">{{Str::title($history->video->title ?? 'No Title')}}</a>
                                </h5>
                                <ul>
                                    <li style="width:50%">
                                        <p class="author author-info"><a
                                                href="{{route('channels.show', $history->video->channel_id)}}"
                                                class="author">{{Str::limit($history->video->channel->title, 10) ?? 'New Channel'}}</a>
                                        </p>
                                    </li>
                                    <li style=" width: 22%">
                                        <p class="views views-info">
                                            <span aria-hidden="true" class="glyphicon glyphicon-comment"></span>
                                            {{$history->video->allcomments->count()}}
                                        </p>
                                    </li>
                                    <li class="right-list" style="width: 22%">
                                        <p class="views views-info">
                                            <span aria-hidden="true" class="glyphicon glyphicon-eye-open"></span>
                                            {{$history->video->views}}
                                        </p>
                                    </li>
                                </ul>
                                <ul>
                                    <li style="width:100%">
                                        <p class="author author-info text-right">
                                            {{$history->updated_at->diffForHumans()}}</a>
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