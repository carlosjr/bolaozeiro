class ChangeColumnTypeJogoTimes < ActiveRecord::Migration
  def change
  	change_column :jogos, :time_a, :string
  	change_column :jogos, :time_b, :string
  end
end
