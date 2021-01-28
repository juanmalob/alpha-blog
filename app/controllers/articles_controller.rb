class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]##llama la funcion set article antes de hacer nada.

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    #byebug hace un stop para debugar
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    #Esto lo mete scaffold @article = Article.new(article_params) # está definido como funcion privada.
    @article = Article.new(params.require(:article).permit(:title, :description))
    #render plain: @article.inspect #esto enseña el articulo que se recibe al hacer submit.
    #redirect_to article_path(@article) o redirect_to @article
    @article.user = User.first
    respond_to do |format|
      if @article.save
        flash[:notice] = "Article was created"
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params) #articles_params se puede poner como params.require(:article).permit(:title, :description)
        flash[:notice] = "Articulo actualizado correctamente"
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private #no necesita un end.

    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :description)
    end

    
end
