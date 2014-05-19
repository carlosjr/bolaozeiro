json.array!(@palpites) do |palpite|
  json.extract! palpite, :id, :usuario_id, :jogo_id, :gols_a, :gols_b, :pontos
  json.url palpite_url(palpite, format: :json)
end
