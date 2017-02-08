Artwork = Vue.resource '/artworks{/id}.json'

Vue.component 'artwork-list',
  template: '#artwork-list'
  data: ()->{
    artworks: [],
    current_page: 0,
    total_pages: 0
  }
  methods:
    load_page: (page)->
      that = this
      this.current_page = page
      Artwork.get({page: page}).then (response) ->
        that.artworks = response.data.data
        that.total_pages = response.data.total_pages

  mounted: () ->
    this.load_page 1