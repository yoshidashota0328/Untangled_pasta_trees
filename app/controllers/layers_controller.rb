class LayersController < ApplicationController
  protect_from_forgery
  before_action :set_layer, only: %i[show edit update destroy]
  skip_before_action :require_login, only: %i[index]
  def index
    tree = Tree.find(params[:tree_id]) 
    # 公開ツリー または 非公開ツリーでユーザがauthor
    if tree.state == "public_tree" || tree.state == "private_tree" && current_user&.id == tree.user_id
      gon.layers = tree.layers.all.order(:layer_id)
      gon.current_user = current_user&.id
      @author = User.find(tree.user_id)
    else
      redirect_back(fallback_location: trees_path)
    end
  end

  def show; end

  def new
    unless Layer.find_by(layer_id: params[:layer_id], user_id: params[:user_id], tree_id: params[:tree_id])
      layer = Layer.new(layer_id: params[:layer_id], positionX: params[:setX], positionY: params[:setY], parent_id: params[:parent_id], user_id: params[:user_id], tree_id: params[:tree_id])
      layer.save
    end
  end

  def create
    @layer = @tree.layers.new(layer_params)
    @layer.save
  end

  def update
    layer = Layer.find_by(layer_id: params[:layer_id], user_id: params[:user_id], tree_id: params[:tree_id])
    layer.update(layer_params)
    redirect_to tree_layers_path
  end

  def destroy
    @layer.destroy
  end

  private

  def set_layer
    @layer = Layer.find_by(layer_id: params[:layer_id], user_id: params[:user_id], tree_id: params[:tree_id])
  end

  def layer_params
    params.permit(:id, :title, :body, :positionX, :positionY, :parent_id, :db_id, :layer_id, :user_id, :tree_id)
  end
end

