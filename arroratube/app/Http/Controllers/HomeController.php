<?php

namespace App\Http\Controllers;

use App\Category;
use App\Subcategory;
use App\Video;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //$this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index(Request $request)
    {


        //return $request->query('subcategory');
        if ($request->has('category')) {
            $query = Category::find($request->query('category'))->name;
            $videos = Video::where('category_id', $request->query('category'))->orderBy('created_at', 'DESC')->paginate(10);
            return view('pages.searches.show_by_category', compact('videos', 'query'));
        } elseif ($request->has('subcategory')) {
            $query = Subcategory::find($request->query('subcategory'))->name;
            $videos = Video::where('subcategory_id', $request->query('subcategory'))->orderBy('created_at', 'DESC')->paginate(10);
            return view('pages.searches.show_by_category', compact('videos', 'query'));
        }
        $topVideos = Video::orderBy('views', 'DESC')->withCount('votes')
            ->orderBy('votes_count', 'DESC')->take(6)->get();
        $videos = Video::orderBy('created_at', 'DESC')->paginate(4);
        if ($request->expectsJson()) {
            $view = view('includes.welcome.videos', compact('videos'))->render();
            return response()->json([
                'videos' => $videos
            ]);
        }
        return view('welcome', compact('videos', 'topVideos'));
    }

    public function histories()
    {
        $histories = auth()->user()->histories;
        return view('pages.histories.history', compact('histories'));
    }

    public function about()
    {
        return view('pages.about');
    }
    public function copyright()
    {
        return view('pages.copyright');
    }
    public function developers()
    {
        return view('pages.developers');
    }
    public function terms()
    {
        return view('pages.terms');
    }
    public function privecy()
    {
        return view('pages.privecy');
    }
    public function press()
    {
        return view('pages.press');
    }
}
