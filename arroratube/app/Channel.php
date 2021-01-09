<?php

namespace App;

use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Spatie\MediaLibrary\MediaCollections\Models\Media;

class Channel extends Model implements HasMedia
{

    use InteractsWithMedia;



    public function registerMediaConversions(Media $media = null): void
    {
        $this->addMediaConversion('thumb')
            ->width(150)
            ->height(150);
    }

    public function image_thumb()
    {
        if ($image = $this->getFirstMedia('images')) {

            return $image->getUrl('thumb');
        }
        return null;
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
    public function videos()
    {
        return $this->hasMany(Video::class);
    }

    public function subscriptions()
    {
        return $this->hasMany(Subscription::class);
    }

    public function getBannerImageAttribute()
    {
        if ($image = $this->getFirstMedia('banner-images')) {

            return $image->getUrl();
        }
        return null;
    }

    public function editable()
    {
        return auth()->check() && auth()->user()->channel->user_id === auth()->id();
    }
}
