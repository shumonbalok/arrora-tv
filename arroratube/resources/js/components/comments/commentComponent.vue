<template>
  <div class="media">
    <div class="media-left">
      <a href="#"><avatar :username="comment.user.name"></avatar> </a>
    </div>
    <div v-if="!showEditForm" class="media-body">
      <p>{{ comment.comment }}</p>
      <span
        >By :<a href="#" style="margin-right: 20px">
          {{ comment.user.name }}
        </a>
        {{ comment.created_at | moment("from", "now") }}
      </span>
      <span style="margin-left: 10px"
        ><button
          @click="showReplay"
          class="btn btn-default btn-xs"
          style="color: #b3b3b3"
        >
          Replay
        </button>
      </span>
      <span v-show="isEdited">
        <button
          @click="edit"
          class="btn btn-default btn-xs"
          style="color: #b3b3b3"
        >
          Edit
        </button>
        <button
          @click="remove()"
          class="btn btn-default btn-xs"
          style="color: #b3b3b3"
        >
          Remove
        </button>
      </span>
      <span style="float: right">
        <vote
          :init_votes="comment.votes"
          :entity_owner="comment.user_id"
          :url="'/comments/' + comment.id + '/vote'"
        ></vote>
      </span>
      <replay-comment
        v-if="replay"
        @replayBack="replayBack"
        :comment="comment"
        :comment_parent_id="commentParentId"
      ></replay-comment>
    </div>
    <div v-else class="media-body">
      <FormulateForm
        v-model="update_fields"
        @submit="updateComment"
        method="POST"
        name="update-comment"
      >
        <FormulateInput
          name="comment"
          type="textarea"
          label=""
          :value="comment.comment"
          validation="required|min:5|max:500"
        />
        <div class="btn-group" style="font-size: 12px">
          <button class="btn btn-info" type="submit" style="font-size: 12px">
            Update
          </button>
          <button
            class="btn btn-default"
            @click="editBack"
            style="font-size: 12px"
          >
            Back
          </button>
        </div>

        <div class="clearfix"></div>
      </FormulateForm>
    </div>
  </div>
</template>
<script>
import Avatar from "vue-avatar";
import replayComment from "./replayCommentComponent.vue";
import EventBus from "../../event-bus.js";
export default {
  props: {
    comment: {
      type: Object,
      required: true,
      default: {},
    },
    comment_parent_id: {
      required: true,
      default: "",
    },
    index: {
      required: true,
      default: "",
    },
  },

  data() {
    return {
      replay: false,
      commentParentId: this.comment_parent_id,
      showEditForm: false,
      update_fields: {},
      // url: "/videos/" + this.comment.video_id + "/comments/" + this.comment.id,
    };
  },

  components: { Avatar, replayComment },

  computed: {
    isEdited() {
      return __authCheck && __auth.id === this.comment.user_id;
    },
  },

  created() {
    EventBus.$on("pushCommentToParent", (data) => {
      if (data.comment_id == this.comment.id) {
        this.comment.replies.unshift(data);
        this.$toast.success("Your comment added successfully", "Success");
      }
    });
  },
  methods: {
    showReplay() {
      if (!__authCheck) {
        return this.$toast.warning("Please Login To replay", "Warning");
      }
      this.replay = true;
    },
    replayBack() {
      this.replay = false;
    },

    edit() {
      this.showEditForm = true;
    },
    remove() {
      axios
        .delete(
          "/videos/" + this.comment.video_id + "/comments/" + this.comment.id,
          {
            id: this.comment.id,
          }
        )
        .then((res) => {
          EventBus.$emit("removeComment", this.index);
        });
    },

    updateComment() {
      axios
        .put(
          "/videos/" + this.comment.video_id + "/comments/" + this.comment.id,
          {
            comment: this.update_fields.comment,
            id: this.comment.id,
          }
        )
        .then((res) => {
          this.comment = res.data.comment;
          this.showEditForm = false;
          this.$toast.success("Your comment updated successfully", "Success");
        });
    },
    editBack() {
      this.showEditForm = false;
    },
  },
};
</script>