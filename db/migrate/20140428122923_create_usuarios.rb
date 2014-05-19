class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
    	t.string :nome, limit: 100
		t.string :email
		t.string :senha

      	t.timestamps
    end
  end
end
