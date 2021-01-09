<?php

namespace App\Jobs\Videos;

use App\Video;
use FFMpeg;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;

class CreateVideoThumbnail implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;


    public $video;
    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct(Video $video)
    {
        $this->video = $video;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        FFMpeg::fromDisk('local')
            ->open($this->video->path)
            ->getFrameFromSeconds(1)
            ->export()
            ->toDisk('local')
            ->save('public/videos/' . $this->video->channel_id . '/thumbnails/' . $this->video->id . '/' . $this->video->id . '.png');

        $this->video->update([
            'thumbnail' => '/storage/videos/' . $this->video->channel_id . '/thumbnails/' . $this->video->id . '/' . $this->video->id . '.png'
        ]);
    }
}
