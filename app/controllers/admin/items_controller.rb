class Admin::ItemsController < Admin::AdminController

	before_action :set_items, only: [:index]
	before_action :set_item, only: [:destroy, :edit, :update]

	def index
	end

	def new
		@item = Item.new
	end

	def edit
	end

	def create
		@item = Item.new item_params

		if @item.save
			flash[:notice] = "成功新增商品「 "+@item.name+" 」。"
			redirect_to action:"index"
		else
			render(:new)
		end
	end

	def destroy
		name = @item.name
		@item.destroy
		flash[:notice] = "刪除商品：「 "+name+" 」。"
		redirect_to :back
	end


	def update
		if @item.update(item_params)
			flash[:notice] = "成功更新商品「 "+@item.name+" 」。"
			redirect_to action:"index"
		else
			flash[:alert] = "無法更新商品「 "+@item.name+" 」。"
			redirect_to(:back)
		end
	end


	private

	def item_params
		params.require(:item).permit(:name, :price, :number, :description, :category_id)
	end

	def set_items
		@items = Item.all.order(:created_at).includes(:category)
	end

	def set_item
		@item = Item.find(params[:id])
	end

end
