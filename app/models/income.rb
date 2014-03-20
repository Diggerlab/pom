class Income < ActiveRecord::Base
  self.table_name = 'fact_user_incomes'
  belongs_to :dim_date
  belongs_to :dim_game
  belongs_to :dim_income_source
  scope :coins_only, where('total_coins > 0')
  scope :gems_only,  where('total_gems > 0')
  scope :today, where("dim_date_id=#{Date.today.strftime('%Y%m%d')}")
  scope :yesterday, where("dim_date_id=#{Date.yesterday.strftime('%Y%m%d')}")
end