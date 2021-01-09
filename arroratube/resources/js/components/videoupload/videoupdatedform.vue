<template>
  <div>
    <div v-if="!videoUpdated">
      <!-- <form v-if="!videoUpdated" style="margin-top: 0" method="POST"> -->
      <button
        class="btn btn-info"
        v-if="addVideoInformation"
        @click="addVideoInformationClick(video.id)"
        :data-id="video.id"
      >
        Add Video Informations
      </button>
      <FormulateForm
        v-else
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
    </div>
    <div v-else>
      <table class="table table-striped">
        <tr>
          <th>Title:</th>
          <td>{{ freshVideo.title }}</td>
        </tr>
        <tr>
          <th>Category:</th>
          <td>{{ freshVideo.category.name }}</td>
        </tr>
        <tr>
          <th>Sub Category:</th>
          <td>{{ freshVideo.subcategory.name }}</td>
        </tr>
        <tr>
          <th>Description:</th>
          <td>{{ freshVideo.description }}</td>
        </tr>
        <tr>
          <th></th>
          <td style="text-align: right">
            <a
              class="btn btn-success"
              :href="'/videos/' + freshVideo.id"
              target="_blank"
              rel="noopener noreferrer"
              >View video</a
            >
          </td>
        </tr>
      </table>
    </div>
  </div>
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
      fields: {},
      videoUpdated: false,
      freshVideo: {},
      addVideoInformation: true,
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
    addVideoInformationClick(id) {
      var data_id = event.target.getAttribute("data-id");
      if (id == data_id) {
        this.addVideoInformation = false;
      }
      console.log(data_id + "=" + id);
    },
    videoEditForm(id) {
      this.addVideoInformation = false;
      axios.put("/video-update/" + id, this.fields).then((res) => {
        this.videoUpdated = true;
        this.freshVideo = res.data.video;
        console.log(res.data.video.title);
      });
      //alert(this.fields);
    },
  },
};
</script>