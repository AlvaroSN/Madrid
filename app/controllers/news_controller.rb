class NewsController < ApplicationController
  class NoticiasController < ApplicationController

    def index
      @noticia = New.all
    end

    def new
      @noticia = New.new
    end

    def create
      @noticia = New.create(params_noticia)
      if @noticia.save
        redirect_to news_portadas_path
      else
        render 'new'
      end
    end

    def show
      @noticia = New.find(params[:id])
    end

    def destroy
      @noticia = New.find(params[:id])
      @noticia.destroy
      redirect_to news_index_path
    end

    def front
      @noticia = New.order("created_at").last(3).reverse
    end

    private
    def params_noticia
      params.require(:new).permit(:title,:subtitle,:content,:photo)
    end

  end
end
