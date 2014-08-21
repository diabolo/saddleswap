class SaddlesController < ApplicationController
  def index
    @saddles = Saddle.all
  end

  def new
  end
end
