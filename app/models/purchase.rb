class Purchase < ActiveRecord::Base
  self.table_name = 'fact_purchases'
  belongs_to :dim_date
  belongs_to :dim_game
  scope :starfish_only, lambda {|option| where('total_gems > 0') if option}
  scope :shells_only, lambda {|option| where('total_coins > 0') if option}

  # search_method :starfish_only
end