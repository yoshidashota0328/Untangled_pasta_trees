class TreesController < ApplicationController
before_action :set_tree, only: %i[edit update destroy]

  def index
    @trees = Tree.all.order(:id)
  end

  def new
    @tree = current_user.trees.new
  end

  def edit; end

  def create
    @tree = current_user.trees.new(set_tree_params)
    @tree.save!
    layer = current_user.layers.new(layer_id: 1, positionX: 500, positionY: 30, parent_id: 1, user_id: current_user.id, tree_id: @tree.id)
    layer.save!
    redirect_to tree_layers_path(@tree.id)
  end

  def update
    @tree.update(set_tree_params)
    redirect_to request.referer
  end

  def destroy
    @tree.destroy
    redirect_to trees_path
  end

  private 

  def set_tree_params
    params.require(:tree).permit(:title, :description, :state)
  end

  def set_tree
    @tree = current_user.trees.find(params[:id])
  end

end
