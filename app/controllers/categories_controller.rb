class CategoriesController < ApplicationController
	before_action :require_admin, except: [:index,:show] 
	def index
		@categories = Category.all
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			flash[:success] = "Target was successfuly created "
			redirect_to categories_path
		else 
			render 'new'
		end
	end

	def show
		@category = Category.find(params[:id])
		@category_articles = @category.articles.paginate(page: params[:page],per_page: 5)
	end

	private
	def category_params
		params.require(:category).permit(:name)
	end
	def require_admin
		if !logged_in? || (logged_in? and !current_user.admin?)
			flash[:danger] = "Only admins can create Categories"
			redirect_to categories_path
		end

	end
end