<?php

namespace App\Http\Controllers;

use App\Comment;
use App\Video;
use App\Vote;
use Illuminate\Http\Request;

class VoteController extends Controller
{

    public function videoVoteStore(Request $request, Video $video)
    {
        $vote = $video->votes()->updateOrCreate(['user_id' => auth()->id()], ['type' => $request->type]);
        return response()->json([
            'vote' => $vote->fresh()
        ]);
    }
    public function commentVoteStore(Request $request, Comment $comment)
    {
        $vote = $comment->votes()->updateOrCreate(['user_id' => auth()->id()], ['type' => $request->type]);
        return response()->json([
            'vote' => $vote->fresh()
        ]);
    }
}
