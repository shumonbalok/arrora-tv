<template>
  <div :class="{ 'video-uploaded': !selected }" class="upload-right">
    <div v-if="selected">
      <div class="upload-file">
        <div class="services-icon">
          <span class="glyphicon glyphicon-open" aria-hidden="true"></span>
        </div>
        <input
          type="file"
          name="videos"
          multiple="multiple"
          ref="videos"
          @change="upload"
        />
      </div>
      <div class="upload-info">
        <h5>Select files to upload</h5>
        <span>or</span>
        <p>Drag and drop files</p>
      </div>
    </div>

    <div v-else>
      <div class="upload-info" v-for="video in videos" :key="video.id">
        <!-- <h5 v-if="video.persentage && video.persentage == 100">
          <a
            :href="'/videos/' + video.id"
            target="_blank"
            rel="noopener noreferrer"
            >{{ video.title || "Video Title" }}</a
          >
        </h5> -->
        <h5>
          {{ video.name }}
        </h5>
        <div class="media">
          <div class="media-left">
            <div v-if="!video.thumbnail"><p>Loading thumbnail...</p></div>
            <div v-else>
              <div v-if="video.persentage != 100">
                <img
                  :src="video.thumbnail"
                  class="media-object"
                  style="width: 150px"
                />
              </div>
              <div v-else>
                <a
                  :href="'/videos/' + video.id"
                  target="_blank"
                  rel="noopener noreferrer"
                  style="width: 150px"
                >
                  <img
                    :src="video.thumbnail"
                    class="media-object"
                    style="width: 150px"
                  />
                </a>
              </div>
            </div>
          </div>
          <div class="media-body">
            <div v-if="video.persentage != 100" class="progress">
              <div
                class="progress-bar progress-bar-success progress-bar-striped text-danger"
                role="progressbar"
                aria-valuenow="40"
                aria-valuemin="0"
                aria-valuemax="100"
                :style="{
                  width: (video.persentage || progress[video.name]) + '%',
                }"
              >
                {{ video.persentage || progress[video.name] }}%
                {{ video.persentage ? "Uploading" : "Processing" }} Complete
              </div>
            </div>

            <div
              v-else
              class=""
              style="margin-top: 0px; text-align: left; font-size: 14px"
            >
              <videoupdatedform :video="video"></videoupdatedform>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    channel: {
      type: Object,
      required: true,
      default: [],
    },
  },

  data() {
    return {
      selected: true,
      videos: [],
      progress: {},
      uploads: [],
      intervals: {},
    };
  },

  methods: {
    upload() {
      this.videos = Array.from(this.$refs.videos.files);
      const uploaders = this.videos.map((video) => {
        this.progress[video.name] = 0;
        const form = new FormData();
        form.append("video", video);
        form.append("name", video.name);
        return axios
          .post("/channels/" + this.channel.id + "/uploadvideo", form, {
            onUploadProgress: (event) => {
              this.progress[video.name] = Math.ceil(
                (event.loaded / event.total) * 100
              );
              this.$forceUpdate();
            },
          })
          .then(({ data }) => {
            this.uploads = [...this.uploads, data];
            this.$toast.success("Video uploaded success", "Success", {
              timeout: 2000,
              position: "bottomRight",
            });
            // console.log(this.videos);
          });
      });

      axios.all(uploaders).then(() => {
        this.videos = this.uploads;

        this.videos.forEach((video) => {
          this.intervals[video.id] = setInterval(() => {
            axios.get("/videos/" + video.id).then(({ data }) => {
              //console.log(data.persentage);
              if (data.persentage == 100) {
                //console.log("Complate");
                clearInterval(this.intervals[video.id]);
              }
              this.videos = this.videos.map((v) => {
                if (v.id === data.id) {
                  //console.log(v.thumbnail);
                  return data;
                }
                //console.log(v.id);
                return v;
              });
            });
          }, 2000);
        });

        // console.log(this.uploads);
        this.$toast.success("Video converted success", "Success", {
          timeout: 2000,
          position: "topRight",
        });
      });

      this.selected = false;
    },
  },
};
</script>