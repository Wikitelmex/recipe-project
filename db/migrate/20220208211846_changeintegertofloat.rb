class Changeintegertofloat < ActiveRecord::Migration[7.0]
def self.up  
    change_column :foods, :price,  :float
  end

  def self.down
    change_column :foods, :price,  :integer
  end
end
