Vue.component 'artwork-card',
  template: "#artwork-card",
  props: ['artwork'],
  methods:
    show: (e) ->
      window.location.href = 'artworks/' + this.artwork.id

