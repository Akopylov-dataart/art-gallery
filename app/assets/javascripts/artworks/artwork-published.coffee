Artwork = Vue.resource '/artworks{/id}.json'

Vue.component 'artwork-published',
  template: '#artwork-published',
  props: ['state', 'artwork_id']
  data: ()->{
    published: this.state
  },
  methods:
    publish: (e)->
      this.published = !this.published;
      Artwork.update({id: this.artwork_id}, {published: this.published})