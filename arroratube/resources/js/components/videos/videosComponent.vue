<template>
  <div>
    <div
      v-for="(video, index) in videos"
      :key="index"
      class="col-md-3 resent-grid recommended-grid"
      style="margin-top: 20px"
    >
      <div class="resent-grid-img recommended-grid-img">
        <a :href="'/videos/' + video.id"
          ><img :src="video.thumbnail" :alt="video.title"
        /></a>
        <div class="time small-time">
          <p>7:30</p>
        </div>
        <div class="clck small-clck">
          <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
        </div>
      </div>
      <div class="resent-grid-info recommended-grid-info video-info-grid">
        <h5>
          <a :href="'/videos/' + video.id" class="title">{{ video.title }}</a>
        </h5>
        <ul>
          <li>
            <p class="author author-info">
              <a href="#" class="author">{{ video.channel.title }}</a>
            </p>
          </li>
          <li class="right-list">
            <p class="views views-info">
              {{ video.created_at | moment("from", "now") }}
            </p>
          </li>
        </ul>
        <ul>
          <li>
            <p class="author author-info">
              <vote
                :init_votes="video.votes"
                :entity_owner="video.channel.user_id"
                :url="'/videos/' + video.id + '/vote'"
              ></vote>
            </p>
          </li>
          <li style="width: 24%">
            <p class="views views-info">
              <span
                aria-hidden="true"
                class="glyphicon glyphicon-comment"
              ></span>
              {{ video.allcomments.length }}
            </p>
          </li>
          <li class="right-list" style="width: 24%">
            <p class="views views-info">
              <span
                aria-hidden="true"
                class="glyphicon glyphicon-eye-open"
              ></span>
              {{ video.views }}
            </p>
          </li>
        </ul>
      </div>
    </div>
    <div class="clearfix"></div>
    <div class="">
      <infinite-loading @distance="1" @infinite="infiniteHandler">
        <div slot="spinner">
          <img src="/images/loading/Ripple-1s-200px.gif" width="100" /></div
      ></infinite-loading>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      videos: [],
      page: 1,
    };
  },

  methods: {
    infiniteHandler($state) {
      let vm = this;

      axios.get("?page=" + this.page).then((res) => {
        if (res.data.videos.data.length) {
          this.page += 1;
          // this.videos = this.videos.push(...res.data.videos.data);
          $.each(res.data.videos.data, function (key, value) {
            vm.videos.push(value);
            // if (res.data.videos.data % 4 == 1) {
            //   $state.complete();
            // }
          });

          $state.loaded();
        } else {
          $state.complete();
        }
      });
    },
  },
};
</script>