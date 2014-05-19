json.array!(@jogos) do |jogo|
  json.extract! jogo, :id, :time_a, :time_b, :gols_a, :gols_b, :data, :hora
  json.url jogo_url(jogo, format: :json)
end
