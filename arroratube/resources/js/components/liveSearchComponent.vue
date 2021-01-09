<template>
  <div class="top-search">
    <vue-instant
      :suggestOnAllWords="true"
      :suggestions="[]"
      :suggestion-attribute="suggestionAttribute"
      v-model="value"
      :disabled="false"
      @input="changed"
      @enter="enter"
      :show-autocomplete="true"
      :autofocus="false"
      name="customName"
      placeholder="Search in this website"
      type="google"
    ></vue-instant>
    <!-- @click-input="clickInput"
      @click-button="clickButton"
      @selected="selected"
      @enter="enter"
      @key-up="keyUp"
      @key-down="keyDown"
      @key-right="keyRight"
      @clear="clear"
      @escape="escape" -->
    <div
      v-if="videos.length || channels.length || hideSuggetion"
      class="el-input-group__append"
    >
      <ul class="vue-instant__suggestions">
        <li v-for="video in videos" class="highlighted__google">
          <a :href="'/search?search=' + video.title">{{ video.title }}</a>
        </li>
        <li v-for="channel in channels" class="highlighted__google">
          <a :href="'/search?search=' + channel.title">{{ channel.title }}</a>
        </li>
      </ul>
    </div>
    <!-- <div v-if="channels.length" class="el-input-group__append">
      <ul class="vue-instant__suggestions">
        <li v-for="channel in channels" class="highlighted__google">
          <a :href="'/search?search=' + channel.title">{{ channel.title }}</a>
        </li>
      </ul>
    </div> -->
  </div>
</template>

<script>
export default {
  data() {
    return {
      value: "",
      suggestionAttribute: "original_title",
      channels: [],
      videos: [],
      selectedEvent: "",
      hideSuggetion: false,
    };
  },

  methods: {
    changed: function () {
      var that = this;
      this.videos = [];
      this.channels = [];
      axios.get("/search?q=" + this.value).then(function (response) {
        response.data.videos.forEach(function (a) {
          that.videos.push(a);
        });
        response.data.channels.forEach(function (a) {
          that.channels.push(a);
        });
      });
    },

    enter: function () {
      window.location = "/search?search=" + this.value;
    },
  },
};
</script>