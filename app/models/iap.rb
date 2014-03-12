class Iap < ActiveRecord::Base
  self.table_name = 'fact_iap'
  belongs_to :dim_date
  belongs_to :dim_game
end