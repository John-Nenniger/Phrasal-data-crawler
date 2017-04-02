class Api::V1::ContentsController < ApplicationController

  def compare
    highlighted = "He says 3D printers today are where "
    matches = Content.where("sentence ILIKE ?", "%#{highlighted}%")
    render json: matches
  end

end
