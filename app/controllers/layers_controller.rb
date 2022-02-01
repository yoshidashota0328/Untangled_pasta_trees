# frozen_string_literal: true

class LayersController < ApplicationController
  protect_from_forgery
  before_action :set_layer, only: %i[show edit update destroy]
  skip_before_action :require_login, only: %i[index]
  def index
    tree = Tree.find(params[:tree_id])
    # 公開ツリー または ユーザがauthor
    if tree.state == 'public_tree' || current_user&.id == tree.user_id
      gon.layers = tree.layers.all.order(:layer_id)
      gon.current_user = current_user&.id
      @author = User.find(tree.user_id)
      gon.search = tree.layers.where('body like ?', "%#{params[:search]}%") if params[:search] != nil
    else
      redirect_back(fallback_location: trees_path)
    end
  end

  def show; end

  def create
    unless set_layer
      layer = Layer.new(layer_params)
      layer.save
    end
  end

  def update
    @layer.update(layer_params)
    redirect_to tree_layers_path
  end

  def destroy
    @layer.destroy
    redirect_to tree_layers_path
  end

  private

  def set_layer
    @layer = Layer.find_by(layer_id: params[:layer_id], user_id: params[:user_id], tree_id: params[:tree_id])
  end

  def layer_params
    params.permit(:id, :title, :body, :positionX, :positionY, :parent_id, :db_id, :layer_id, :user_id, :tree_id)
  end
end