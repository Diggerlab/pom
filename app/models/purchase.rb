class Purchase < ActiveRecord::Base
  self.table_name = 'fact_purchases'
  belongs_to :dim_date
  belongs_to :dim_game
  scope :coins_only, where('total_coins > 0')
  scope :gems_only,  where('total_gems > 0')
  #scope :today, -> { where("dim_date_id=#{Date.today.strftime('%Y%m%d')}") }
  scope :today, -> { where(dim_date_id: Date.today.strftime('%Y%m%d'))}
  scope :yesterday, -> { where(dim_date_id: Date.yesterday.strftime('%Y%m%d'))}
end