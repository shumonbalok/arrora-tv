@extends('layouts.app')
@section('styles')
<style>
    .video-uploaded {
        padding-top: 0 !important;
    }
</style>
@endsection
@section('content')

<div class="show-top-grids">
    <div class="col-sm-12 single-left">
        <div class="upload-grids">

            <video-upload :channel="{{auth()->user()->channel}}"></video-upload>

            <div class="upload-right-bottom-grids">
                <div class="col-md-4 upload-right-bottom-left">
                    <h4>Help and Suggestions</h4>
                    <div class="upload-right-top-list">
                        <ul>
                            <li><a href="#">Lorem ipsum dolor sit amet</a></li>
                            <li><a href="#">Fusce egestas tincidunt massa</a></li>
                            <li><a href="#">Pellentesque vehicula quis tellus</a></li>
                            <li><a href="#">Etiam gravida feugiat tortor eget eleifend</a></li>
                            <li><a href="#">Etiam iaculis facilisis metus a viverra</a></li>
                            <li><a href="#">Fusce sed enim non orci molestie</a></li>
                            <li><a href="#">Lorem ipsum dolor sit amet</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-4 upload-right-bottom-left">
                    <h4>Import videos</h4>
                    <div class="upload-right-top-list">
                        <ul>
                            <li><a href="#">Lorem ipsum dolor sit amet</a></li>
                            <li><a href="#">Fusce egestas tincidunt massa</a></li>
                            <li><a href="#">Pellentesque vehicula quis tellus</a></li>
                            <li><a href="#">Etiam gravida feugiat tortor eget eleifend</a></li>
                            <li><a href="#">Etiam iaculis facilisis metus a viverra</a></li>
                            <li><a href="#">Fusce sed enim non orci molestie</a></li>
                            <li><a href="#">Lorem ipsum dolor sit amet</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-4 upload-right-bottom-left">
                    <h4>Live streaming</h4>
                    <div class="upload-right-top-list">
                        <ul>
                            <li><a href="#">Lorem ipsum dolor sit amet</a></li>
                            <li><a href="#">Fusce egestas tincidunt massa</a></li>
                            <li><a href="#">Pellentesque vehicula quis tellus</a></li>
                            <li><a href="#">Etiam gravida feugiat tortor eget eleifend</a></li>
                            <li><a href="#">Etiam iaculis facilisis metus a viverra</a></li>
                            <li><a href="#">Fusce sed enim non orci molestie</a></li>
                            <li><a href="#">Lorem ipsum dolor sit amet</a></li>
                        </ul>
                    </div>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
    </div>
    <div class="clearfix"> </div>
</div>

@endsection