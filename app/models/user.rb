class User < ActiveRecord::Base
  self.table_name = 'fact_active_users'
  belongs_to :dim_date
  belongs_to :dim_game
  scope :today, where("dim_date_id=#{Date.today.strftime('%Y%m%d')}")
  scope :yesterday, where("dim_date_id=#{Date.yesterday.strftime('%Y%m%d')}")
end