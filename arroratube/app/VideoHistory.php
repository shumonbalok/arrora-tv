<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class VideoHistory extends Model
{
    protected $table = 'video_histories';

    public function video()
    {
        return $this->belongsTo(Video::class);
    }
}
