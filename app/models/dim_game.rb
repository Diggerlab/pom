class DimGame < ActiveRecord::Base
  self.table_name = 'dim_games'
  def to_s
    self.name
  end
end