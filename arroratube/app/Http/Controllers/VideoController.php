<?php

namespace App\Http\Controllers;

use App\User;
use App\Video;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class VideoController extends Controller
{
    public function show(Video $video)
    {
        if (request()->expectsJson()) {
            return $video;
        }
        $video = $video->load(['votes']);
        return view('pages.videos.show', compact('video'));
    }

    public function updateView(Request $request, Video $video)
    {
        if (auth()->check()) {
            DB::table('video_histories')
                ->updateOrInsert(['user_id' => auth()->id(), 'video_id' => $video->id], ['updated_at' => now()]);
        }
        $video->increment('views');
        return response()->json([]);
    }

    public function edit(Video $video)
    {
        return view('pages.videos.edit', compact('video'));
    }

    public function update(Request $request, Video $video)
    {
        $data = $request->validate([
            'title' => 'required|max:100|min:10',
            'category_id' => 'required',
            'subcategory_id' => 'required',
            'description' => 'max:500',
        ]);
        $video->update($data);
        return response()->json([
            "video" => $video->load(['category', 'subcategory'])
        ]);
    }
}
