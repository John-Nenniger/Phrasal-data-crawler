class Api::V1::ContentsController < ApplicationController

  def compare
    # handle incoming rails params object, permit only what is needed to avoid
    # possible script injection
    phrase_params = params.require(:highlighted).permit(:phrase, :content)
    # get the highlighted phrase out of the params
    highlighted = phrase_params[:phrase]
    # run the query, matches is an active record relation object
    matches = Content.where("sentence ILIKE ?", "%#{highlighted}%")
    puts matches
    @contents = matches
    # this will then send @contents over to compare.json.jbuilder
  end

end
