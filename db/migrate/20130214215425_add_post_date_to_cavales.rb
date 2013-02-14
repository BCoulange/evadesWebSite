class AddPostDateToCavales < ActiveRecord::Migration
  def change
  	add_column :cavales, :post_date,  :datetime
  end
end
