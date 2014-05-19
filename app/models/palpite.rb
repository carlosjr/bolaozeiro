class Palpite < ActiveRecord::Base
	validates_presence_of :jogo_id, :usuario_id
	#validates_presence_of :gols_a, message: "deve ser preenchido"
	#validates_presence_of :gols_b, message: "deve ser preenchido"

	validates_presence_of :usuario_id, :jogo_id
	validates_associated :usuario, :jogo

	belongs_to :jogo
	belongs_to :usuario
end
