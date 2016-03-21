class PagesController < ApplicationController

  def home
    render :layout => 'home'
  end

  def search
     #@vn = Vn.includes(:genres).where('genres.id' => params['genre_ids']).all
      #@vn = Vn.includes(:genres).where('genres.id' => params['genre_ids'])

     # @vn = Vn.joins(:genres).where('genres.id' => params['genre_ids']).group('genre_id').having('count(genre_id) > 2')
      # @vn = Vn.joins(:genres).where('genres.id' => params['genre_ids']).group('vns.id')

      @vn = Vn.search_by_name(params[:search]) unless params[:search].blank?

    # @vn = Vn.includes(:genres).where('genres.id' => params['genre_ids']).all
     #Image.includes(:tags).where('tags.id' => params['tag_ids']).all
  end

  def typeahead

    @vn = Vn.search_by_name(params[:search])
    @name = @vn.select('name').map(&:name)
    render json: @name,root: false
  end

  def help
  end

  
end
