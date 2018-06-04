class Api::V1::ItemsController < ApiController
  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
  end

  def create
    item = Item.create(item_params)
    render json: item
  end

  private

    def item_params
      params.permit(:name, :description, :image_url)
    end
end
