<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Channel;
use App\User;
use Faker\Generator as Faker;

$factory->define(Channel::class, function (Faker $faker) {
    return [
        'title' => $faker->name(),
        'description' => $faker->sentence(2),
        'user_id' => $faker->randomElement(User::all()->pluck('id')),
    ];
});
