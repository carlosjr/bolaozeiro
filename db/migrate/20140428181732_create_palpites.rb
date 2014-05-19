class CreatePalpites < ActiveRecord::Migration
  def change
    create_table :palpites do |t|
    	t.integer :usuario_id
    	t.integer :jogo_id
    	t.integer :gols_a
    	t.integer :gols_b
    	t.integer :pontos  
		t.timestamps
    end
  end
end
