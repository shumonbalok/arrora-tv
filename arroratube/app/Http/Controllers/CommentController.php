<?php

namespace App\Http\Controllers;

use App\Comment;
use App\Video;
use Illuminate\Http\Request;

class CommentController extends Controller
{

    public function filter(Request $request, Video $video)
    {
        if ($request->filter == 'top-comment') {
            $comments = Comment::where('video_id', $video->id)->whereNull('comment_id')
                ->withCount('replies')
                ->orderBy('replies_count', 'DESC')->paginate(3)->withQueryString();
        } else if ($request->filter == 'old-comment') {
            $comments = Comment::where('video_id', $video->id)->whereNull('comment_id')
                ->orderBy('created_at', 'asc')->paginate(3)->withQueryString();
        } else if ($request->filter == 'my-comment') {
            $comments = Comment::where('video_id', $video->id)->whereNull('comment_id')
                ->where('user_id', auth()->id())
                ->paginate(3)->withQueryString();
        }

        return response()->json([
            'comments' => $comments
        ]);
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Video $video)
    {
        $comments = $video->comments()->paginate(3);
        return response()->json([
            'comments' => $comments
        ]);
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request, Video $video)
    {
        //return $request->all();
        $comment = $video->comments()->create([
            'user_id' => auth()->id(),
            'comment' => $request->comment,
            'comment_id' => $request->comment_id ?? null
        ])->fresh();
        return response()->json([
            'comment' => $comment->load(['user', 'votes']),
            'comments_count' => $video->comments()->count()
        ]);
    }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Comment  $comment
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        // return $video;

        $comment = Comment::findOrFail($request->id);
        $comment->update(['comment' => $request->comment]);
        $comment = $comment->refresh();
        return response()->json([
            'comment' => $comment->load(['user', 'votes'])
        ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Comment  $comment
     * @return \Illuminate\Http\Response
     */
    public function destroy(Video $video, Comment $comment)
    {

        $comment->votes()->delete();
        $comment->replies()->delete();
        $comment->delete();

        return response()->json([
            // 'id' => $comment->id
        ]);
    }
}
