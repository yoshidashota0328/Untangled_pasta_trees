class LayersController < ApplicationController
  protect_from_forgery
  before_action :set_layer, only: %i[show edit update destroy]
  def index
    @layers = Layer.all.order(:id)
    gon.layers = @layers
    unless Layer.find_by(id: 1)
      layer = Layer.new(id: 1, positionX: 1200, positionY: 30, parent_id: 1)
      layer.save
    end
    @layer1 = Layer.find_by(id: 1)
    gon.positionX = Layer.find_by(id: 1).positionX
    gon.positionY = Layer.find_by(id: 1).positionY
  end

  def show; end

  def new
    leaf_i = params[:id]
    unless Layer.find_by(id: leaf_i)
      layer = Layer.new(id: leaf_i, positionX: params[:setX], positionY: params[:setY], parent_id: params[:parent_id])
      layer.save
    end
  end

  def create
    @layer = Layer.new(layer_params)
    @layer.save
  end

  def update
    @layer.update(layer_params)
  end

  def destroy
    @layer.destroy
  end

  private

  def set_layer
    @layer = Layer.find(params[:id])
  end

  def layer_params
    params.permit(:title, :body, :positionX, :positionY, :parent_id, :branch)
  end
end

