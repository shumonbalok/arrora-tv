<template>
  <div style="display: inline">
    <button
      :class="{ 'like-voted': upvoted }"
      class="like"
      @click.prevent="vote('up')"
    >
      <span
        :class="{ 'like-voted': upvoted }"
        aria-hidden="true"
        class="glyphicon glyphicon-thumbs-up"
      ></span>
    </button>
    <span class="song-info-span">{{ upvotes_count }}</span>

    <button
      :class="{ 'dislike-voted': downvoted }"
      class="dislike"
      @click.prevent="vote('down')"
    >
      <span
        :class="{ 'dislike-voted': downvoted }"
        aria-hidden="true"
        class="glyphicon glyphicon-thumbs-down"
      ></span>
    </button>
    <span class="song-info-span">{{ downvotes_count }}</span>
  </div>
</template>
<script>
import numeral from "numeral";
export default {
  props: {
    init_votes: {
      type: Array,
      required: true,
      default: () => [],
    },
    entity_owner: {
      type: String,
      required: true,
      default: "",
    },
    url: {
      type: String,
      required: true,
      default: "",
    },
  },
  data() {
    return {
      votes: this.init_votes,
      ownerId: this.entity_owner,
      // videoId: this.entity_id,
    };
  },
  computed: {
    upvotes() {
      return this.votes.filter((vote) => {
        return vote.type === "up";
      });
    },
    downvotes() {
      return this.votes.filter((vote) => {
        return vote.type === "down";
      });
    },

    upvotes_count() {
      return numeral(this.upvotes.length).format("0a");
    },
    downvotes_count() {
      return numeral(this.downvotes.length).format("0a");
    },

    upvoted() {
      if (!__authCheck) {
        return;
      }

      return !!this.upvotes.find((v) => {
        return v.user_id == __auth.id;
      });
    },
    downvoted() {
      if (!__authCheck) {
        return;
      }

      return !!this.downvotes.find((v) => {
        return v.user_id == __auth.id;
      });
    },
  },

  methods: {
    vote(type) {
      if (__authCheck && __auth.id == this.ownerId) {
        return this.$toast.warning(
          "You can not like or dislike your own componant",
          "Warning",
          {
            timeout: 2000,
            position: "topRight",
          }
        );
      }

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
      if (type == "up" && this.upvoted) return;
      if (type == "down" && this.downvoted) return;

      axios
        .post(this.url, {
          type: type,
        })
        .then((res) => {
          if (this.upvoted || this.downvoted) {
            this.votes = this.votes.map((v) => {
              if (v.user_id === __auth.id) {
                return res.data.vote;
              }
              return v;
            });
          } else {
            this.votes.push(res.data.vote);
          }
        });
    },
  },
};
</script>