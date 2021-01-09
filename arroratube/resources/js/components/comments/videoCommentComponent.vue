<template>
  <div class="all-comments">
    <div class="all-comments-info">
      <a href="#">All Comments ({{ total_comments }})</a>
      <div class="box">
        <FormulateForm
          v-model="fields"
          @submit="createComment"
          method="POST"
          name="create-comment"
        >
          <FormulateInput
            name="comment"
            type="textarea"
            label=""
            validation="required|min:5|max:500"
          />
          <FormulateInput type="submit" label="Comment" />
          <div class="clearfix"></div>
        </FormulateForm>
      </div>
      <div class="all-comments-buttons">
        <ul>
          <li>
            <a
              href=""
              @click.prevent="topComments"
              :class="{ 'my-active': top_comments }"
              class="top"
              >Top Comments</a
            >
          </li>
          <li>
            <a
              href=""
              @click.prevent="oldestFirst"
              :class="{ 'my-active': old_comments }"
              class="top newest"
              >Oldest First</a
            >
          </li>
          <li>
            <a
              href=""
              @click.prevent="myComments"
              :class="{ 'my-active': my_comments }"
              class="top my-comment"
              >My Comments</a
            >
          </li>
        </ul>
      </div>
    </div>

    <div class="media-grids">
      <div v-for="(comment, index) in comments" :key="comment.id">
        <comment
          :comment="comment"
          :comment_parent_id="comment.id"
          :index="index"
        ></comment>

        <div
          class="comment-replies"
          v-for="(replay, index1) in comment.replies"
          :key="replay.id"
        >
          <comment
            :comment="replay"
            :comment_parent_id="comment.id"
            :index="index1"
          ></comment>
        </div>
      </div>
      <div v-if="next_page_url" class="media" style="text-align: center">
        <button @click="loadMoreComment" class="btn btn-success">
          Load more
        </button>
      </div>
    </div>
  </div>
</template>

<script>
import Comment from "./commentComponent";
import EventBus from "../../event-bus";
export default {
  props: {
    video: {
      type: Object,
      required: true,
      default: {},
    },
  },

  components: { Comment },

  data() {
    return {
      comments: [],
      fields: {},
      total_comments: "",
      next_page_url: null,
      top_comments: false,
      old_comments: false,
      my_comments: false,
    };
  },

  mounted() {
    this.fatchComment();
  },

  created() {
    EventBus.$on("removeComment", (index) => {
      this.comments.splice(index, 1);
      this.$toast.success("Your comment deleted successfully", "Success");
    });
  },

  methods: {
    topComments() {
      axios
        .get("/videos/" + this.video.id + "/comments/filter", {
          params: { filter: "top-comment" },
        })
        .then((res) => {
          this.comments = res.data.comments.data;
          this.next_page_url = res.data.comments.next_page_url;
          this.old_comments = false;
          this.my_comments = false;
          this.top_comments = true;
        });
    },
    oldestFirst() {
      axios
        .get("/videos/" + this.video.id + "/comments/filter", {
          params: { filter: "old-comment" },
        })
        .then((res) => {
          this.comments = res.data.comments.data;
          this.next_page_url = res.data.comments.next_page_url;
          this.my_comments = false;
          this.top_comments = false;
          this.old_comments = true;
        });
    },
    myComments() {
      if (!__authCheck) {
        return this.$toast.warning(
          "You need to signin to perform this action",
          "Warning",
          {
            timeout: 3000,
            position: "topRight",
          }
        );
      }
      axios
        .get("/videos/" + this.video.id + "/comments/filter", {
          params: { filter: "my-comment" },
        })
        .then((res) => {
          this.comments = res.data.comments.data;
          this.next_page_url = res.data.comments.next_page_url;
          this.old_comments = false;
          this.top_comments = false;
          this.my_comments = true;
        });
    },

    fatchComment() {
      axios.get("/videos/" + this.video.id + "/comments").then((res) => {
        this.comments = res.data.comments.data;
        this.next_page_url = res.data.comments.next_page_url;
        this.total_comments = res.data.comments.total;
      });
    },

    loadMoreComment() {
      var url = this.next_page_url;

      axios.get(url).then((res) => {
        this.next_page_url = res.data.comments.next_page_url;
        this.comments.push(...res.data.comments.data);
      });
    },

    createComment() {
      if (!__authCheck) {
        return this.$toast.warning(
          "Please login to like or dislike this componant",
          "Warning",
          {
            timeout: 3000,
            position: "topRight",
          }
        );
      }
      axios
        .post("/videos/" + this.video.id + "/comments", {
          comment: this.fields.comment,
        })
        .then((res) => {
          this.$formulate.reset("create-comment");
          this.comments.unshift(res.data.comment);
          this.total_comments = res.data.comments_count;
          this.$toast.success("Your comment added successfully", "Success", {
            timeout: 2000,
            position: "topRight",
          });
        });
    },
  },
};
</script>