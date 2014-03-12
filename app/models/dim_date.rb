class DimDate < ActiveRecord::Base
  self.table_name = 'dim_dates'
  def to_s
    self.full_date
  end
end