class ContentsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @contents = Content.all
  end

  def new
    @content = Content.new
  end

  def create
    @content = current_user.contents.build(content_params)
    if @content.save
      redirect_to contents_path, notice: "Conteúdo criado com sucesso!"
    else  
      render :new
    end
  end

  def edit
    @content = Content.find(params[:id])
  end

  def update
    
  end

  private
    def content_params
      params.require(:content).permit(:title, :description)
    end

end
