class ContentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_content, only: %i[show edit update destroy]
  
  def index
    @contents = Content.all
  end

  def show; end

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

  def edit; end

  def update
    if @content.update(content_params)
      redirect_to contents_path, notice: "Conteúdo atualizado com sucesso!"
    else  
      render :edit
    end
  end

  def destroy
    @content.destroy
    redirect_to contents_path, notice: "Conteúdo apagado com sucesso!"
  end

  private
    def set_content
      @content = Content.find(params[:id])
    end

    def content_params
      params.require(:content).permit(:title, :description)
    end

end
