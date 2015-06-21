class Api::PublicAlbumsController < ApplicationController
  before_action :must_be_logged_in, only: [:show]

  # def index
  #   @user = User.find(params[:user_id])
  #   @albums = @user.albums
  #   # TODO: Use user.albums association
  #   render :index
  # end

  def show
    @album = Album.find(params[:id])
    render :show
  end


  private
    def must_be_logged_in
      if Album.find(params[:id]).password
        if Album.find(params[:id]).password == ""
          return
        elsif current_album.id.to_i != params[:id].to_i
          # render "Blah", status: :forbidden
          # redirect_to new_album_session_url
            render text: "None!", status: :forbidden
        end
      end

    end
end
