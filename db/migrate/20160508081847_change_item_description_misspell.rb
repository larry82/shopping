class ChangeItemDescriptionMisspell < ActiveRecord::Migration
  def change
  	rename_column :items, :descreption,:description
  end
end
