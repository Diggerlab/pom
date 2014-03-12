ActiveAdmin.register Iap do
  config.sort_order = "dim_date_id_desc"
  config.clear_action_items!
  index do
    column :dim_date
    column :product
    column :count
  end

  filter :dim_date
  filter :dim_game
end
