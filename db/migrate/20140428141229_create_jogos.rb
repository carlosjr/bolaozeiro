class CreateJogos < ActiveRecord::Migration
  def change
    create_table :jogos do |t|
    	t.integer :time_a
    	t.integer :time_b
    	t.integer :gols_a
    	t.integer :gols_b
    	t.string :data
    	t.string :hora
      	t.timestamps
    end
  end
end
