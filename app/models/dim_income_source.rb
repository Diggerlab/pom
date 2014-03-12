class DimIncomeSource < ActiveRecord::Base
  self.table_name = 'dim_income_sources'
  def to_s
    self.name
  end
end