# == Schema Information
#
# Table name: recipes
#
#  id          :integer          not null, primary key
#  event_id    :integer
#  link        :string
#  title       :string
#  description :string
#  image       :string
#  created_at  :datetime
#  updated_at  :datetime
#

class RecipesController < ApplicationController
  before_action :set_recipe, only: [ :edit, :update, :destroy]
  before_action :set_event, only: [:new, :edit,  :create, :update]
  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.all.page params[:page]
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.event = @event
    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @event, notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @event, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @event}
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params[:recipe].permit(:link, :title, :description, :image)
    end
    def set_event
      @event = Event.find(params[:event_id])
    end
end
