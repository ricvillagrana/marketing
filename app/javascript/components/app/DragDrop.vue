<template>
  <div>
    <p v-if="!dragging" class="dropzone-message p-0 m-0 title is-5 has-text-centered has-text-grey">Arrastra y suelta las imágenes aquí.</p>
    <p v-else
      @dragover="dragging = true"
      class="dropzone-message p-0 m-0 title is-5 has-text-centered has-text-grey">Suelta la imagen.</p>
      <div
        class="dropzone has-text-centered"
        :class="{ 'is-dragging' : dragging }"
        @ondrop="$swal('dropped')">
        <input
          class="drop-reciever pointer"
          type="file"
          id="items"
          name="items[]" 
          required
          multiple
          @dragenter="dragging = true"
          @dragend="dragging = false"
          @dragleave="dragging = false"
          @change="checkFiles">
      </div>
      <div class="p-10 mt-10">
        <div class="dropzone-content">
          <span v-for="(image, key) in images" :key="key" class="flex flex-row-reverse">
            <img :src="image.url" :alt="image.name">
            <a class="button is-danger" @click="handleDeleteImage(image.key)">
              <i class="fa fa-times"></i>
              Eliminar
            </a>
          </span>
        </div>
      </div>
  </div>
</template>

<script>
export default {
  name: 'drag-drop',
  data: () => ({
    dragging: false,
    images: []
  }),
  methods: {
    handleDeleteImage: function (key) {
      this.images = this.images.filter(image => image.key !== key)
    },
    checkFiles: function (e) {
      const that = this
      const files = e.target.files

      if (files && files[0]) {
        for (const key in files) {
          if (files.hasOwnProperty(key)) {
            const element = files[key]
            const reader = new FileReader()
            reader.onload = function (e) {
              console.log(e)
              const image = {
                key: key,
                lastModified: element.lastModified,
                lastModifiedDate: element.lastModifiedDate,
                name: element.name,
                size: element.size,
                type: element.type,
                webkitRelativePath: element.webkitRelativePath,
                url: e.target.result
              }
              if (image.type == 'image/png' || image.type == 'image/jpeg') that.images.push(image)
              else that.$swal({
                type: 'error',
                title: 'Tipo de archivo no admitido',
                text: `${image.name} es inválido, los correctos son 'image/png' o 'image/jpeg', tú intentas subir ${image.type}`
              })
            };
            reader.readAsDataURL(files[key])
            
          }
        }
      }
    }
  },
  watch: {
    images: function () { this.$emit('images', this.images) }
  }
}
</script>
