<template>
  <FormulateForm
    v-model="replay_fields"
    @submit="replayComment"
    method="POST"
    name="replay-comment"
  >
    <FormulateInput
      name="replay"
      type="textarea"
      label=""
      validation="required|min:5|max:500"
    />
    <div class="btn-group">
      <!-- <FormulateInput type="submit" label="Replay" /> -->
      <button class="btn btn-info" type="submit">Replay</button>
      <button class="btn btn-default" @click="replayBack">Back</button>
    </div>

    <div class="clearfix"></div>
  </FormulateForm>
</template>

<script>
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
      default: {},
    },
  },
  data() {
    return {
      replay_fields: { replay: this.comment.user.name },
    };
  },

  methods: {
    replayBack() {
      this.$emit("replayBack");
    },
    replayComment() {
      if (!__authCheck) {
        return this.$toast.warning(
          "Please login to like or dislike this componant",
          "Warning",
          {
            timeout: 2000,
            position: "topRight",
          }
        );
      }
      axios
        .post("/videos/" + this.comment.video_id + "/comments", {
          comment: this.replay_fields.replay,
          comment_id: this.comment_parent_id,
        })
        .then((res) => {
          //   console.log(this.comment.replies);
          this.$emit("replayBack");
          EventBus.$emit("pushCommentToParent", res.data.comment);
          this.$formulate.reset("replay-comment");
        });
    },
  },
};
</script>