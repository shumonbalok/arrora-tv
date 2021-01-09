<template>
  <FormulateForm
    v-model="fields"
    @submit="videoEditForm(video.id)"
    method="POST"
  >
    <FormulateInput
      name="title"
      label="Title"
      validation="required|min:5|max:100"
      placeholder="Add Video Title"
    />
    <FormulateInput
      name="category_id"
      label="Category"
      type="select"
      validation="required"
      placeholder="Select Category"
      :options="categories"
    />

    <FormulateInput
      name="subcategory_id"
      label="Subcategory"
      placeholder="Select Subcategory"
      validation="required"
      type="select"
      :options="subcategories"
    />

    <FormulateInput
      type="textarea"
      name="description"
      label="Description"
      validation="min:5|max:500"
    />

    <FormulateInput type="submit" label="Save" />

    <div class="clearfix"></div>
  </FormulateForm>
</template>

<script>
export default {
  props: {
    video: {
      type: Object,
      required: true,
      default: [],
    },
  },
  data() {
    return {
      categories: {},
      subcategories: {},
      fields: this.video,
      freshVideo: {},
    };
  },
  mounted() {
    axios.get("/categories").then((res) => {
      this.categories = res.data.categories;
    });
    this.getSubcatagories();
  },

  watch: {
    ["fields.category_id"]: function () {
      this.getSubcatagories();
    },
  },

  methods: {
    getSubcatagories() {
      axios
        .get("/subcategories", {
          params: {
            category_id: this.fields.category_id,
          },
        })
        .then((res) => {
          this.subcategories = res.data.subcategories;
        });
    },

    videoEditForm(id) {
      this.addVideoInformation = false;
      axios.put("/video-update/" + id, this.fields).then((res) => {
        // this.videoUpdated = true;
        // this.freshVideo = res.data.video;
        this.$toast.success("Video updated success", "Success", {
          timeout: 3000,
          position: "topRight",
        });
        window.location.href = "/videos/" + res.data.video.id;
      });
      //alert(this.fields);
    },
  },
};
</script>