class ArtistsController < ApplicationController
  def index
    @artists = if params[:term].nil? || params[:term].empty?
                 Artist.all
               else
                 Artist.where 'name like ?', "%#{params.permit(:term)[:term]}%"
               end
  end
end
