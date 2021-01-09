@extends('layouts.app')


@section('content')
<div class="show-top-grids">
    <div class="col-sm-8 single-left">
        <div class="song">

            <div class="video-grid">
                <video-js id="my-video" class="video-js" controls preload="auto" width="520" height="300">
                    {{-- <source src=http://techslides.com/demos/sample-videos/small.mp4 type=video/mp4 /> --}}
                    <source src={{'/storage/videos/'.$video->channel_id. '/'.$video->id.'/'.$video->id.'.m3u8'}}
                        type=application/x-mpegURL />
                    <p class="vjs-no-js">
                        To view this video please enable JavaScript, and consider upgrading to a
                        web browser that
                        <a href="https://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a>
                    </p>
                </video-js>
            </div>
            <div class="song-info">
                <h3>{{$video->title ?? "Etiam molestie nisl eget consequat pharetra"}}</h3>
            </div>
            <div class="song-info">
                <vote :init_votes="{{$video->votes}}" entity_owner="{{$video->channel->user_id}}"
                    url="{{'/videos/'. $video->id . '/vote'}}"></vote>

                <p class="pull-right">
                    {{$video->views}} {{ Str::plural('view', $video->views) }}
                    @if (auth()->check() && auth()->user()->channel->id == $video->channel_id)
                    <a href="{{route('videos.edit', $video->id)}}" class="btn btn-success">Edit Video</a>
                    @endif
                </p>



            </div>
        </div>
        <div class="clearfix"> </div>
        <div class="published">
            <div class="load_more">
                <ul id="myListd" style="list-style: none; padding: 5px;">
                    <li>
                        <div class="media">
                            <div class="media-left">
                                <a href="{{route('channels.show', $video->channel->id)}}">
                                    <img class="img-responsive img-circle"
                                        src="{{asset($video->channel->image_thumb())}}"
                                        alt="{{$video->channel->title}}">
                                </a>
                            </div>
                            <div class="media-body">
                                <div class="pull-left">
                                    <h5>{{$video->channel->title ?? 'Title Not Yet Found. Please add title'}}</h5>
                                    <span>Published on {{$video->created_at->toFormattedDateString()}}</span>
                                </div>

                                <div class="pull-right">
                                    <subscriber-button :init-subscriptions="{{$video->channel->subscriptions}}"
                                        :channel="{{$video->channel}}">
                                    </subscriber-button>
                                </div>
                            </div>
                        </div>
                        <p>{{$video->description ?? 
                            "Nullam fringilla sagittis tortor ut rhoncus. Nam vel ultricies erat, vel sodales leo.
                            Maecenas pellentesque, est suscipit laoreet tincidunt, ipsum tortor vestibulum leo," }}</p>
                    </li>
                    <li>

                        <div class="load-grids">
                            <div class="load-grid">
                                <p>Category</p>
                            </div>
                            <div class="load-grid">
                                <a href="movies.html">{{$video->category->name ?? 'No category'}}</a>
                            </div>
                            <div class="load-grid">
                                <p>Subcategory</p>
                            </div>
                            <div class="load-grid">
                                <a href="movies.html">{{$video->subcategory->name ?? 'No subcategory'}}</a>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>

        <video-comment :video="{{$video}}"> </video-comment>

    </div>
    <div class="col-md-4 single-right">
        <h3>Up Next</h3>
        <div class="single-grid-right">
            <div class="single-right-grids">
                <div class="col-md-4 single-right-grid-left">
                    <a href="single.html"><img src="images/r1.jpg" alt="" /></a>
                </div>
                <div class="col-md-8 single-right-grid-right">
                    <a href="single.html" class="title"> Nullam interdum metus</a>
                    <p class="author"><a href="#" class="author">John Maniya</a></p>
                    <p class="views">2,114,200 views</p>
                </div>
                <div class="clearfix"> </div>
            </div>
            <div class="single-right-grids">
                <div class="col-md-4 single-right-grid-left">
                    <a href="single.html"><img src="images/r2.jpg" alt="" /></a>
                </div>
                <div class="col-md-8 single-right-grid-right">
                    <a href="single.html" class="title"> Nullam interdum metus</a>
                    <p class="author"><a href="#" class="author">John Maniya</a></p>
                    <p class="views">2,114,200 views </p>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
    </div>
    <div class="clearfix"> </div>
</div>
@endsection

@section('styles')
<link href="https://vjs.zencdn.net/7.8.4/video-js.css" rel="stylesheet" />

@endsection

@section('scripts')
<script src="https://vjs.zencdn.net/7.8.4/video.js"></script>
<script>
    var player = videojs('my-video');
    player.options.responsive = true;
    var viewlogged = false;
    player.on('timeupdate', function () {
        var persentage = Math.ceil((player.currentTime()/player.duration())*100)
        if (persentage > 10 && !viewlogged) {
            //console.log(persentage);
            axios.put("/videos/{{$video->id}}")
            viewlogged = true;
        }
        
    })
</script>
@endsection