class VideosController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @videos = Video.all
  end

  def show
  end

  def new
    @new_video = Video.new
  end

 def create
    @new_video = Video.new(new_video_params)
    if @new_video.save
      redirect_to videos_path
    else
      render :new
    end
  end

  def edit
  end

  def destroy
  end

  private

  def new_video_params
    params.require(:video).permit(:title,
                                  :description,
                                  :channel,
                                  :photo,
                                  :link,
                                  :user_id)
  end

end
