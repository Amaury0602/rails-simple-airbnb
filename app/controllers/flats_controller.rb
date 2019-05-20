class FlatsController < ApplicationController
  def index
    @flats = Flat.all
  end

  def show
    @flat = Flat.find(params[:id])
  end

  def new
    @flat = Flat.new
    raise
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.3save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def edit
    @flat = Flat.find(params['id'])
  end

  def update
    @flat.update(flat_params)
  end

  def delete
    @flat = Flat.find(params['id'])
    @flat.destroy
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end
end
