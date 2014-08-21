class SaddlesController < ApplicationController
  def index
    @saddles = Saddle.all
  end
end
