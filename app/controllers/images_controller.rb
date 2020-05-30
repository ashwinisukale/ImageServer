class ImagesController < ApplicationController
  before_action :set_gallery, only: [:create, :index]

  # GET /images
  def index
    #byebug
    images = @gallery.to_json(:include => { :images => { :only => [], :methods => [:avatar_url] }})
    render json: images
  end

  # POST /images
  def create
    if @gallery && params[:avatars]
        params[:avatars].values.each { |avatar|
          @gallery.images.create(avatar: avatar)
        }
      render json: @gallery.images, status: :created
    else
      render json: { errror: "Error while uploading images" }, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gallery
      @gallery = Gallery.find_or_create_by(name: 'My gallery')
    end

    # Only allow a trusted parameter "white list" through.
    def image_params
      params.require(:avatars).permit(avatars: [])
    end
end
