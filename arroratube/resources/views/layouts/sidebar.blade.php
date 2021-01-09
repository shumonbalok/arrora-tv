<div class="col-sm-3 col-md-2 sidebar">
    <div class="top-navigation">
        <div class="t-menu">MENU</div>
        <div class="t-img">
            <img src="{{asset('images/lines.png')}}" alt="" />
        </div>
        <div class="clearfix"> </div>
    </div>
    <div class="drop-navigation drop-navigation">
        <ul class="nav nav-sidebar">
            <li class="active"><a href="{{url('/')}}" class="home-icon"><span class="glyphicon glyphicon-home"
                        aria-hidden="true"></span>Home</a></li>
            @if ($categories)
            @foreach ($categories as $category)
            <li>
                <a href="{{route('home', ['category' => $category->id])}}"
                    class="{{$category->subcategories->count() > 0 ? 'menu'.$loop->index : ''}}"><span
                        class="sidebar-icon {{$category->icon}}"
                        aria-hidden="true"></span>{{Str::title($category->name)}}
                    @if ($category->subcategories->count() > 0)
                    <span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span>
                    @endif
                </a>
            </li>
            @if ($category->subcategories->count() > 0)
            <ul class="cl-effect cl-effect-{{$loop->index}}">
                @foreach ($category->subcategories as $subcat)
                <li><a href="{{route('home', ['subcategory' => $subcat->id])}}">{{Str::title($subcat->name)}}</a></li>
                @endforeach
            </ul>
            @endif
            @endforeach
            @endif

            @auth
            <li><a href="{{route('histories')}}" class="sub-icon"><span
                        class="glyphicon glyphicon-home glyphicon-hourglass" aria-hidden="true"></span>History</a></li>

            <li><a href="{{ route('channels.show', auth()->user()->channel->id) }}" class="user-icon"><span
                        class="glyphicon glyphicon-user" aria-hidden="true"></span>My Channel</a></li>

            @endauth
        </ul>
        <div class="side-bottom">
            <div class="side-bottom-icons">
                <ul class="nav2">
                    <li><a href="#" class="facebook"> </a></li>
                    <li><a href="#" class="facebook twitter"> </a></li>
                    <li><a href="#" class="facebook chrome"> </a></li>
                    <li><a href="#" class="facebook dribbble"> </a></li>
                </ul>
            </div>
            <div class="copyright">
                <p>Copyright © 2020 My Play. All Rights Reserved | Develoved by <a href="#">Shumon
                        Pal</a></p>
            </div>
        </div>
    </div>
</div>