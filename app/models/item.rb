class Item < ActiveRecord::Base
	belongs_to :category

	validates :name, :description, :price, :number, :category_id, presence: true
end
