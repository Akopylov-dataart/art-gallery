class ArtworksController < ApplicationController
  before_action :set_artwork, only: [:show, :update]

  # GET /artworks
  # GET /artworks.json
  def index
    @artworks = Artwork.order('created_at DESC').page(params[:page])
  end

  # GET /artworks/1
  # GET /artworks/1.json
  def show
  end

  # GET /artworks/new
  def new
    @artwork = Artwork.new
  end

  # POST /artworks
  # POST /artworks.json
  def create
    @artwork = Artwork.unpublished.new(new_artwork_params)
    @artwork.artist = Artist.find_or_initialize_by name: artist_params[:artist_name]

    #add transaction if needed
    respond_to do |format|
      if @artwork.save
        format.html { redirect_to @artwork, notice: 'Artwork was successfully created.' }
        format.json { render :show, status: :created, location: @artwork }
      else
        format.html { render :new }
        format.json { render json: @artwork.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artworks/1
  # PATCH/PUT /artworks/1.json
  def update
    respond_to do |format|
      if @artwork.update(update_artwork_params)
        format.json { render :show, status: :ok, location: @artwork }
      else
        format.json { render json: @artwork.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artwork
      @artwork = Artwork.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def new_artwork_params
      params.require(:artwork).permit(:title, :year, :image, :medium_list)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def artist_params
      params.require(:artwork).permit(:artist_name)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def update_artwork_params
      params.require(:artwork).permit(:published)
    end
end
