ActiveAdmin.register Income do
  config.sort_order = "dim_date_id_desc"
  config.clear_action_items!
  csv do
    column :dim_date_id
    column :dim_income_source
    column :total_coins
  end
  index do
    column :dim_date
    column :dim_income_source
    column :total_coins
    # column :total_gems
  end

  filter :dim_date
  filter :dim_game
  filter :dim_income_source
  # filter :total_gems
  filter :total_coins
end
