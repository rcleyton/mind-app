class ContentsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @contents = Content.all
  end

  def new
    @content = Content.new
  end

end
