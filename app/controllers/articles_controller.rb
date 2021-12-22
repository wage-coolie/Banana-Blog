class ArticlesController < ApplicationController
	before_action :set_article, only: [:edit, :update, :destroy, :show]
	before_action :required_user ,except: [:index,:show]
	before_action :require_same_user,only: [:edit,:update,:destroy]
	def index
		@articles = Article.page params[:page]
	end

	def new
		@article = Article.new
	end

	def edit
		
	end

	def update
		
		if @article.update(article_params)
			flash[:success] = "Successfully updates..."
			redirect_to article_path(@article)
		else
			render "edit"
		end

	end

	def create
		
		@article = Article.new(article_params)
		@article.user = current_user
		if @article.save
			flash[:success] = "Successfully created..."
			redirect_to article_path(@article)
		else
			render "new"
		end
		
	end

	def show
		
	end

	def destroy
		
		@article.destroy
		flash[:danger] = "Successfully destroyed..."
		redirect_to articles_path
	end

	private

	def set_article
		@article = Article.find(params[:id])

	end
	def article_params
		params.require(:article).permit(:title,:description,category_ids:[])

	end
	def require_same_user
		if current_user != @article.user and !current_user.admin?
			flash[:danger] = "Delete your own article, you have no right to do this to a fellow banana lover"
			redirect_to root_path
		end
	end

end