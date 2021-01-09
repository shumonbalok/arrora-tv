<template>
  <div>
    <button
      @click="tuggleSubscription()"
      class="btn btn-danger"
      style="float: right"
    >
      {{ owner ? "" : subscribed ? "Unubscribe" : "Subscribe" }}
      <span class="badge">{{ count }}</span>
      {{ owner ? "Subscribers" : "" }}
    </button>
  </div>
</template>

<script>
import numeral from "numeral";

export default {
  props: {
    channel: {
      type: Object,
      require: true,
      default: () => [],
    },
    initSubscriptions: {
      type: Array,
      require: true,
      default: () => [],
    },
  },

  data: function () {
    return {
      subscriptions: this.initSubscriptions,
      userId: __authCheck ? __auth.id : null,
      //count: this.initSubscriptions.length,
    };
  },

  computed: {
    subscribed() {
      if (!__authCheck) return false;
      if (this.channel.user_id === this.userId) return false;
      return !!this.subscription;
    },

    owner() {
      if (__authCheck && this.channel.user_id === this.userId) return true;
      return false;
    },

    subscription() {
      if (!__authCheck) return null;
      return this.subscriptions.find(
        (subscription) => subscription.user_id === this.userId
      );
    },
    count() {
      //return this.subscriptions.length;
      if (!__authCheck) {
        return numeral(this.initSubscriptions.length).format("0a");
      }
      return numeral(this.subscriptions.length).format("0a");
    },
  },

  methods: {
    tuggleSubscription() {
      if (!__authCheck) {
        return this.$toast.warning("Please Login To Subscribe", "Warning", {
          timeout: 3000,
          position: "topRight",
        });
      }
      if (this.owner) {
        return this.$toast.warning(
          "You can not subscribe your own channel",
          "Warning",
          {
            timeout: 3000,
            position: "topRight",
          }
        );
      }
      if (this.subscribed) {
        axios
          .delete(
            "/channels/" +
              this.channel.id +
              "/subscriptions/" +
              this.subscription.id
          )
          .then((res) => {
            this.subscriptions = this.subscriptions.filter((sub) => {
              //return alert(sub.id);
              return sub.id !== this.subscription.id;
            });
          });
      } else {
        axios
          .post("/channels/" + this.channel.id + "/subscriptions/")
          .then((res) => {
            console.log(res.data);
            this.subscriptions.push(res.data);
          });
      }
    },
  },
};
</script>
