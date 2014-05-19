class Usuario < ActiveRecord::Base

	validates_presence_of :nome, message: "deve ser preenchido"
	validates_presence_of :email, message: "deve ser preenchido"
	validates_presence_of :senha, message: "deve ser preenchido"

	validates_uniqueness_of :nome, message: "nome já cadastrado"
	validates_uniqueness_of :email, message: "email já cadastrado"

	has_many :palpites
end
