@extends('layouts.app')

@section('content')
<div class="show-top-grids">
    <div class="col-sm-12 single-left">
        <div class="" style="margin-top: -20px;">

            <form id="update-channel-form" action="{{route('channels.update', $channel->id)}}" method="POST"
                enctype="multipart/form-data">
                @csrf
                @method('PATCH')
                <div class="developers-banner creators-banner"
                    style="background: url({{asset($channel->banner_image)}}) no-repeat 0px -100px !important;background-size: cover; height:300px">

                    @if ($channel->editable())

                    <span class="glyphicon glyphicon-pencil image-edit-button"
                        onclick="document.getElementById('banner-image').click()" aria-hidden="true"></span>
                    <input type="file" name="banner_image" id="banner-image" style="display: none"
                        onchange="document.getElementById('update-channel-form').submit()">

                    @endif

                    <!-- container -->
                    <div class="developers-info">
                        @if ($channel->editable())
                        <div class="image-overlay" onclick="document.getElementById('profile-image').click()">
                            @endif
                            <img class="img-thumbnail image" src="{{asset($channel->image_thumb())}}"
                                alt="{{$channel->title}}">
                            <div class="image-overlay-content">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                            </div>

                            @if ($channel->editable())
                        </div>
                        <input type="file" name="image" id="profile-image" style="display: none"
                            onchange="document.getElementById('update-channel-form').submit()">
                        @endif
                    </div>
                </div>

            </form>

            <div class="row">
                <div class="col-sm-6">
                    <h1 style="font-size: 30px; color:#0076CC;">{{$channel->title}} </h1>
                </div>
                <div class="col-sm-6">
                    <subscriber-button :init-subscriptions="{{$channel->subscriptions}}" :channel="{{$channel}}">
                    </subscriber-button>

                </div>
            </div>

            <hr>

            <div class="creators-grids">
                @foreach ($channel->videos->groupBy('category_id') as $key => $videos)
                <div class="recommended">
                    @foreach ($videos->take(8)->chunk(4) as $cKey => $videoChunk)
                    <div class="recommended-grids">
                        @if ($cKey == 0)
                        <div class="recommended-info">
                            <h3>{{Str::ucfirst(\App\Category::find($key)->name ?? 'Uncategorized')}} </h3>
                        </div>
                        @endif
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
                                    <li>
                                        <p class="author author-info">
                                            <vote :init_votes="{{$video->votes}}"
                                                entity_owner="{{$video->channel->user_id}}"
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
                        @endforeach
                        <div class="clearfix"> </div>
                    </div>
                    @endforeach
                </div>
                @endforeach
            </div>



            <div class="creators-bottom">
                <!--  -->
                <div class="">
                    <div class="creators-bottom-grids-info">
                        <h3>The video platform you will love</h3>
                    </div>
                    <div class="creators-bottom-grids">
                        <div class="col-md-4 creators-bottom-grid">
                            <div class="services-icon">
                                <span class="glyphicon glyphicon-globe" aria-hidden="true"></span>
                            </div>
                            <h4>Global</h4>
                            <p>Lorem Ipsum is simply Ipsum has been the industry's text of the printing and typesetting
                                industry. </p>
                        </div>
                        <div class="col-md-4 creators-bottom-grid green">
                            <div class="services-icon">
                                <span class="glyphicon glyphicon-magnet" aria-hidden="true"></span>
                            </div>
                            <h4>Engaging</h4>
                            <p>Lorem Ipsum is simply Ipsum has been the industry's text of the printing and typesetting
                                industry. </p>
                        </div>
                        <div class="col-md-4 creators-bottom-grid red">
                            <div class="services-icon">
                                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
                            </div>
                            <h4>Helpful</h4>
                            <p>Lorem Ipsum is simply Ipsum has been the industry's text of the printing and typesetting
                                industry. </p>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                </div>
                <!-- // -->
            </div>
        </div>
    </div>
    <div class="clearfix"> </div>
</div>

@endsection