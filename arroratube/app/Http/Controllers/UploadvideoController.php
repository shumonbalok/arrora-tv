<?php

namespace App\Http\Controllers;

use App\Channel;
use App\Jobs\Videos\ConvertForStreaming;
use App\Jobs\Videos\CreateVideoThumbnail;
use Illuminate\Http\Request;

class UploadvideoController extends Controller
{
    public function index(Channel $channel)
    {
        return view('pages/channels.uploadvideo');
    }

    public function store(Channel $channel, Request $request)
    {
        //return $request->all();
        $video = $channel->videos()->create([
            'title' => $request->title,
            'description' => $request->description,
            'path' => $request->video->store('channels/' . $channel->id),
        ]);

        dispatch(new CreateVideoThumbnail($video));
        dispatch(new ConvertForStreaming($video));
        return  $video;
    }
}
