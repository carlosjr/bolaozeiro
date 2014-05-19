class Jogo < ActiveRecord::Base
	validates_presence_of :time_a, message: "deve ser preenchido"
	validates_presence_of :time_b, message: "deve ser preenchido"

	has_many :palpites, :dependent => :destroy
	accepts_nested_attributes_for :palpites
end
