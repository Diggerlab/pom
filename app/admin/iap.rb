ActiveAdmin.register Iap do
  config.sort_order = "dim_date_id_desc"
  config.clear_action_items!
  csv do
    column :dim_date_id
    column ('Product Name') {|p| p.product }
    column ('Product Id') {|p| p.product_id }
    column :count
  end
  scope :all
  scope :today
  scope :yesterday
  index do
    column :dim_date
    column 'Product Id', :product_id
    column 'Product Name', :product
    column :count
  end

  filter :dim_date_id, :as => :numeric, :label => 'Time'
  filter :dim_game
end
