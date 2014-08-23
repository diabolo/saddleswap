class SaddlesController < ApplicationController
  def index
    @saddles = Saddle.all
  end

  def show
    load_saddle
  end

  def new
    build_saddle
  end

  def create
    build_saddle
    save_saddle or render 'new'
  end

  private

  def build_saddle
    @saddle ||= saddle_scope.build
    @saddle.attributes = saddle_params
  end

  def load_saddle
    @saddle ||= saddle_scope.find(params[:id])
  end

  def save_saddle
    if @saddle.save
      redirect_to @saddle, success: 'Saddle added'
    end
  end

  def saddle_params
    saddle_params = params[:saddle]
    saddle_params ? saddle_params.permit(:brand) : {}
  end

  def saddle_scope
    Saddle.all
  end
end
