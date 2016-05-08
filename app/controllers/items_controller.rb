class ItemsController < ApplicationController
	before_action :set_items, only: [:index]

	def index
		@categories = Category.all.order(:id)
	end



	private

	def set_items
		@items = Item.all.order(:created_at).includes(:category)
	end


end
