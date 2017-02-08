Artwork = Vue.resource '/artworks{/id}.json'

Vue.component 'artwork-form',
  template: '#artwork-form',
  data: ()->{
    artwork: {},
    image_selected: false
  },
  mounted: () ->
    this.initValidator()
    this.image_cont = $('#artwork-image-preview');
    $('#artwork_image').change(this.imagePreview.bind(this))
    $("#artwork_mediums").select2
      tags: true

  methods:
    validate: (field, value)->
      this.validator.validate field, value
    imagePreview: (e)->
      this.artwork.image = e.target.files[0];

      if(this.image_selected)
        this.image_cont.cropper('replace',window.URL.createObjectURL(this.artwork.image))
      else
        that = this
        this.image_selected = true
        this.image_cont.attr('src', window.URL.createObjectURL(this.artwork.image)).ready () ->
          that.image_cont.cropper
            aspectRatio: 16 / 9
      this.validate('image',this.artwork.image);

    validateForm: () ->
      this.validator.validateAll
        title: this.artwork.title,
        year: this.artwork.year,
        artist: this.artwork.artist_name,
        image: this.artwork.image

    initValidator: ()->
      this.validator = new VeeValidate.Validator
        title: 'required',
        year: 'required|numeric',
        artist: 'required',
        image: 'required',
      this.$set(this, 'errors', this.validator.errorBag);
    save: (e)->
      this.validateForm()
      if !this.errors.any()
        data = new FormData $('#new_artwork')[0]
        mediums = $("#artwork_mediums").val();

        if(mediums)
          data.append 'artwork[medium_list]', mediums

        this.image_cont.cropper('getCroppedCanvas').toBlob (blob)->
          data.append 'artwork[image]', blob

          Artwork.save(null, data).then (response) ->
            window.location.href = response.data.url;