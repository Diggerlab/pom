class Income < ActiveRecord::Base
  self.table_name = 'fact_user_incomes'
  belongs_to :dim_date
  belongs_to :dim_game
  belongs_to :dim_income_source
  scope :coins_only, lambda {|option| where('total_coins > 0') if option}
  scope :gems_only, lambda {|option| where('total_gems > 0') if option}

  # search_method :starfish_only
end