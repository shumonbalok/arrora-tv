/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue');



var numeral = require('numeral');
var moment = require('vue-moment');


import Vue from "vue";
import VueFormulate from '@braid/vue-formulate';

import VueIziToast from 'vue-izitoast';
import 'izitoast/dist/css/iziToast.css';
import 'vue-instant/dist/vue-instant.css'
import VueInstant from 'vue-instant/dist/vue-instant.common'

Vue.use(VueInstant)
Vue.use(VueFormulate)
Vue.use(VueIziToast);
Vue.use(moment);


// import { Form } from './Form';
// window.Form = Form;
/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i)
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default))
Vue.component('InfiniteLoading', require('vue-infinite-loading'));
Vue.config.ignoredElements = ['video-js']
Vue.component('live-search', require('./components/liveSearchComponent.vue').default);
Vue.component('subscriber-button', require('./components/subscribers/SubscriberComponent.vue').default);
Vue.component('video-upload', require('./components/videoupload/uploadComponent.vue').default);
Vue.component('videoupdatedform', require('./components/videoupload/videoupdatedform.vue').default);
Vue.component('videoedit-form', require('./components/videoupload/videoeditFormComponent.vue').default);
Vue.component('vote', require('./components/votes/voteComponent.vue').default);
Vue.component('video-comment', require('./components/comments/videoCommentComponent.vue').default);
Vue.component('videos', require('./components/videos/videosComponent.vue').default);


/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */



const app = new Vue({
    el: '#app',
});



