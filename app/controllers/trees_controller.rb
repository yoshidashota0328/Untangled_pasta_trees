class TreesController < ApplicationController
before_action :set_tree, only: %i[edit update destroy]
skip_before_action :require_login, only: %i[index]

  def index
    @q = Tree.ransack(params[:q])
    @trees = @q.result.order(:id).page(params[:page]).where(state: "public_tree")
  end

  def new
    @tree = current_user.trees.new    
  end

  def edit; end

  def create
    @tree = current_user.trees.new(set_tree_params)
    if @tree.save
      layer = current_user.layers.new(layer_id: 1, positionX: 500, positionY: 30, parent_id: 1, user_id: current_user.id, tree_id: @tree.id)
      layer.save!
      redirect_to tree_layers_path(@tree.id)
    else
      flash.now[:danger] = "Create failure.Title and description are limited to 10 characters."
      render :new
    end
  end

  def update
    if @tree.update(set_tree_params)
      unless request.referer&.include?("layers")
        redirect_to user_path, success: 'Update successful.'
      end
    else
      flash[:danger] = "Update failure.Title and description are limited to 10 characters."
      render :new
    end
  end

  def destroy
    @tree.destroy
    redirect_to request.referer
  end

  private 

  def set_tree_params
    params.require(:tree).permit(:id, :title, :description, :state, :leaf_count)
  end

  def set_tree
    @tree = current_user.trees.find(params[:id])
  end

end
