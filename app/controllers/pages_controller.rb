class PagesController < ApplicationController

  def home
    @vns = Vn.where(isFeatured: true).limit(4).order("RANDOM()")
    @users = User.where.not(:poster_image => nil).joins(:library_entries).group("users.id").having("count(library_entries.id) > ?",1).order("updated_at DESC").limit(6)
    render :layout => 'home'
  end

  def search
     #@vn = Vn.includes(:genres).where('genres.id' => params['genre_ids']).all
      #@vn = Vn.includes(:genres).where('genres.id' => params['genre_ids'])

     # @vn = Vn.joins(:genres).where('genres.id' => params['genre_ids']).group('genre_id').having('count(genre_id) > 2')
      # @vn = Vn.joins(:genres).where('genres.id' => params['genre_ids']).group('vns.id')

      @vn = Vn.search_by_name(params[:search]).paginate(:page => params[:page], :per_page => 25) unless params[:search].blank?

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

  def anime_sim_home

    render :layout => 'anime_sim'
  end

  def anime_sim_about

    render :layout => 'anime_sim'
  end

  def anime_sim_characters

    render :layout => 'anime_sim'
  end

  def anime_sim_gallery

    render :layout => 'anime_sim'
  end

  def anime_sim_story

    render :layout => 'anime_sim'
  end

  def anime_sim_press
    render :layout => 'none'
  end


  
end
