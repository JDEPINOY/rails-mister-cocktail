class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredients = Ingredient.all
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    # @dose.ingredient = Ingredient.find(params[:dose][:ingredient_id])

    if @dose.save
      redirect_to cocktail_path(params[:cocktail_id])
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    index = @dose.cocktail_id
    # @cocktail.dose.destroy
    @dose.destroy
    redirect_to cocktail_path(index)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end

end
