class MediaItemsController < ApplicationController
  before_action :set_media_item, only: [:show, :edit, :update, :destroy]

  layout 'admin', except: [:show]

  # GET /media_items
  def index
    @media_items = apply_scopes(MediaItem.all).page(params[:page]).per(60)
  end

  # GET /media_items/1
  def show
  end

  # GET /media_items/new
  def new
    @media_item = MediaItem.new
  end

  # GET /media_items/1/edit
  def edit
  end

  # POST /media_items
  def create
    @media_item = MediaItem.new(media_item_params)

    if @media_item.save
      redirect_to @media_item, notice: 'Media item was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /media_items/1
  def update
    if @media_item.update(media_item_params)
      redirect_to @media_item, notice: 'Media item was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /media_items/1
  def destroy
    @media_item.destroy
    redirect_to media_items_url, notice: 'Media item was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_media_item
      @media_item = MediaItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def media_item_params
      params.require(:media_item).permit(:title, :slug, :caption, :alternative_text, :description, :attachment)
    end
end
