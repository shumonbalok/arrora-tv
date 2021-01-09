<template>
  <div>
    <div
      v-for="video in videos"
      :key="video.id"
      class="col-md-3 resent-grid recommended-grid"
    >
      <!-- <div class="resent-grid-img recommended-grid-img">
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
              {{ video.created_at }}
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
      </div> -->
    </div>
    <div class="recommended-info">
      <!-- <infinite-loading
        @distance="1"
        @infinite="infiniteHandler"
      ></infinite-loading> -->
    </div>
  </div>
</template>

<script>
export default {
  props: {
    videos: {
      type: Array,
      required: true,
      default: [],
    },
  },
  mounted() {
    console.log("infifnite");
  },
  // data() {
  //   return {
  //     videos: [],
  //     page: 1,
  //   };
  // },
  // methods: {
  //   infiniteHandler($state) {
  //     this.$http
  //       .get("/posts?page=" + this.page)

  //       .then((response) => {
  //         return response.json();
  //       })
  //       .then((data) => {
  //         $.each(data.data, (key, value) => {
  //           this.list.push(value);
  //         });

  //         $state.loaded();
  //       });

  //     this.page = this.page + 1;
  //   },
  // },
};
</script>