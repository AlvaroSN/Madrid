class NewsController < ApplicationController

    def index
      puts "--------------ENTRO EN EL CONTROLADOR DE NOTICIAS----------------"
      @noticia = New.all.order("created_at").reverse
    end

    def new
      @noticia = New.new
    end

    def create
      @noticia = New.create(params_noticia)
      if @noticia.save
        redirect_to news_index_path
      else
        render 'new'
      end
    end

    def edit
      @noticia = New.find(params[:id])
    end

    def update
      @noticia = New.find(params[:id])
      if @noticia.update(params_noticia)
        redirect_to @noticia
      else
        render 'edit'
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
