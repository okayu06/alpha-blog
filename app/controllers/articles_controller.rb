class ArticlesController < ApplicationController
  before_action:set_article, only:[:edit, :update, :show, :destroy]
  def index
   @articles = Article.all  
  end
  
  def new 
    @article =Article.new
  end  
  
  def edit 
    
  end
  
  def create
    #debugger
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    @article.user = User.first
    if @article.save
      #flashというのは内部的に何をしているのかというと、HTTPレスポンスを返す際にそのレスポンスヘッダーにそのメッセージを仕込ませるという処理を行っています。その都度レスポンスヘッダーに情報を渡すだけなので、このflashによるメッセージが表示されるのは一回限りです。ブラウザの更新ボタンを押したりして再度リクエストを送るとメッセージは表示されません。
      flash[:success] = "Article was successfully saved"
      redirect_to articles_path
    else
      #newtemplateをrenderinsg
      render 'new'
    end  
    #@article.save
    #redirect_to article_path(@articles)
  end  
  
  def update 
    
    if @article.update(article_params)
      flash[:success] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end  
  end
    
  
  def show 
    
  end  
  
  def destroy
    
    @article.destroy
    flash[:danger] = "destruction was successful"
    redirect_to articles_path
  end  
  
  private
  
  def set_article
    @article = Article.find(params[:id])
  end  
  def article_params
    params.require(:article).permit(:title,:description)
  end  
end  