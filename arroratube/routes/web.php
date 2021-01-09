<?php

use App\Http\Controllers\UploadvideoController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/histories', function () {
//     return auth()->user()->histories;
// });

Auth::routes(['verify' => true]);

Route::get('/', 'HomeController@index')->name('home');
Route::get('/about', 'HomeController@about')->name('about');
Route::get('/copyright', 'HomeController@copyright')->name('copyright');
Route::get('/developers', 'HomeController@developers')->name('developers');
Route::get('/terms', 'HomeController@terms')->name('terms');
Route::get('/privecy', 'HomeController@privecy')->name('privecy');
Route::get('/press', 'HomeController@press')->name('press');


Route::resource('channels', 'ChannelController');
Route::get('videos/{video}', 'VideoController@show')->name('videos.show');
Route::put('videos/{video}', 'VideoController@updateView');
Route::get('videos/{video}/comments', 'CommentController@index')->name('comments.index');
Route::get('videos/{video}/comments/filter', 'CommentController@filter');
Route::get('search', 'SearchController');

Route::middleware('verified')->group(function () {
    Route::resource('categories', 'CategoryController');
    Route::resource('subcategories', 'SubcategoryController');
    Route::get('channels/{channel}/uploadvideo', 'UploadvideoController@index')->name('channels.uploadvideo');
    Route::post('channels/{channel}/uploadvideo', 'UploadvideoController@store');
    Route::resource('channels/{channel}/subscriptions', 'SubscriptionController')->only(['store', 'destroy']);
    Route::get('videos/{video}/edit', 'VideoController@edit')->name('videos.edit');
    Route::put('video-update/{video}', 'VideoController@update')->name('video-update');
    Route::post('videos/{video}/vote', 'VoteController@videoVoteStore')->name('videos.vote');
    Route::resource('videos/{video}/comments', 'CommentController')->except(['index', 'show', 'edit', 'create']);
    Route::post('comments/{comment}/vote', 'VoteController@commentVoteStore')->name('comments.vote');
    Route::get('histories', 'HomeController@histories')->name('histories');
});
