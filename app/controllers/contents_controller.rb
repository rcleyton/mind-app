class ContentsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @contents = Content.all
  end

end
