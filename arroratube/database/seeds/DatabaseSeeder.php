<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // $this->call(UsersTableSeeder::class);
        //factory(App\User::class, 5)->create();
        factory(App\User::class, 5)->create()->each(function ($u) {
            $u->channel()
                ->save(
                    factory(App\Channel::class)->make()
                );
        });
        factory(App\Subscription::class, 15)->create();
        factory(App\Category::class, 4)->create();
        factory(App\Subcategory::class, 16)->create();
    }
}
