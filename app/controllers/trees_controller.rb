class TreesController < ApplicationController
before_action :set_tree, only: %i[]

  def index
    @trees = Tree.all.order(:id)
  end

  def new
    @tree = current_user.trees.new
  end

  def create
    @tree = current_user.trees.new(set_tree_params)
    @tree.save!
    layer = current_user.layers.new(layer_id: 1, positionX: 500, positionY: 30, parent_id: 1, user_id: current_user.id, tree_id: @tree.id)
    layer.save!
    redirect_to tree_layers_path(@tree.id)
  end

  private 

  def set_tree_params
    params.require(:tree).permit(:title, :description)
  end

  def set_tree
    @tree = current_user.trees.find(params[:id])
  end

end
