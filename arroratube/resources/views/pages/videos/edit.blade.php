@extends('layouts.app')

@section('content')

@section('styles')
<style>
    .formulate-form {
        font-size: 16px;
    }

    .panel-heading h3 {
        width: 90%;
        float: left;
        margin-top: 3px;
        color: #7b7979;
    }
</style>
@endsection
<div class="show-top-grids">
    <div class="col-sm-12 single-left">
        <div class="upload-grids">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3>{{Str::title($video->title)}}</h3>
                    <a style="width: 10%" class="btn btn-info" href="{{url()->previous()}}">Back</a>
                </div>
                <div class="panel-body">
                    <div class="media">
                        <div class="media-left">
                            <a href="{{route('videos.show', $video->id)}}" style="width: 150px">
                                <img src="{{$video->thumbnail}}" class="media-object" style="width: 150px" />
                            </a>
                        </div>
                        <div class="media-body">
                            <videoedit-form :video="{{$video}}"></videoedit-form>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <div class="clearfix"> </div>
</div>

@endsection