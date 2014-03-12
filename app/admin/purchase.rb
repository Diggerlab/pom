ActiveAdmin.register Purchase do
  config.sort_order = "dim_date_id_desc"
  config.clear_action_items!
  index do
    column :dim_date
    column :item
    column :total_count
    column :total_coins
    column :total_gems
  end

  filter :dim_date
  filter :dim_game
  filter :item
  filter :total_gems
  filter :total_coins
  # filter :starfish_only, as: :radio, collection: [['any', nil], ['yes', true]]
end