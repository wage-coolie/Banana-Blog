class ArticlesController < ApplicationController



	def new
		@article = Article.new
	end
	def create
		@article = Article.new(article_param)
		if @article.save
			flash[:notice] = "Successfully created..."
			redirect_to article_path(@article)
		else
			render "new"
		end
		
	end

	def show
		@article=Article.find(params[:id])
	end

	private
	def article_param
		params.require(:article).permit(:title,:description)
	end

end