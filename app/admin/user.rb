ActiveAdmin.register User do
  config.sort_order = "dim_date_id_desc"
  config.clear_action_items!
  csv do
    column :dim_date_id
    column :today_users 
    column :today_logins 
  end
  scope :all
  scope :today
  scope :yesterday
  index do
    column :dim_date
    column :today_users
    column :today_logins
  end

  filter :dim_date
  filter :dim_game
end
