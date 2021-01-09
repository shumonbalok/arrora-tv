<?php

namespace App;


class Video extends Model
{


    public function channel()
    {
        return $this->belongsTo(Channel::class);
    }
    public function category()
    {
        return $this->belongsTo(Category::class);
    }
    public function subcategory()
    {
        return $this->belongsTo(Subcategory::class);
    }

    public function votes()
    {
        return $this->morphMany(Vote::class, 'voteable');
    }
    public function comments()
    {
        return $this->hasMany(Comment::class)->whereNull('comment_id')->orderBy('created_at', 'DESC');
    }
    public function allcomments()
    {
        return $this->hasMany(Comment::class);
    }
}
