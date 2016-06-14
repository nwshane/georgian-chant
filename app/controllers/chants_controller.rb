class ChantsController < ApplicationController
  def index
    @chants = Chant.all
  end

  def new
    @chant = Chant.new
  end

  def create
    @chant = Chant.new(chant_params)
    @chant.save!

    redirect_to action: :index
  end

  def chant_params
    params.require(:chant).permit(:title)
  end
end
