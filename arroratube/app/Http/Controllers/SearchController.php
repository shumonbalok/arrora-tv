<?php

namespace App\Http\Controllers;

use App\Channel;
use App\Video;
use Illuminate\Http\Request;

class SearchController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function __invoke(Request $request)
    {
        if ($request->has('search')) {
            $channels = Channel::where('title', 'LIKE', "%$request->search%")->limit(5)->get();
            $videos = Video::where('title', 'LIKE', "%$request->search%")->limit(5)->get();
            // $channels = Channel::where('title', 'LIKE', "%$request->search%")
            //     ->orWhere('description', 'LIKE', "%$request->search%")->limit(5)->get();
            // $videos = Video::where('title', 'LIKE', "%$request->search%")
            //     ->orWhere('description', 'LIKE', "%$request->search%")->limit(5)->get();

            return view('pages.searches.search', compact('channels', 'videos'));
        } elseif ($request->has('q')) {
            $channels = Channel::where('title', 'LIKE', "%$request->search%")->limit(5)->get();
            $videos = Video::where('title', 'LIKE', "%$request->search%")->limit(5)->get();

            return response()->json([
                'channels' => $channels,
                'videos' => $videos,
            ]);
        }
    }
}
