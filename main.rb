require 'csv'

hashi = { expert_newsroom_id: [], expert_name: [], expert_url: [], top_expert_id: [], total_project_count_us: [], expertises: [] }

CSV.foreach("companies_us.csv", headers: true) do |fila|
  puts "ID: #{fila['expert_newsroom_id']}"
  puts "Nombre: #{fila['expert_name']}"
  puts "URL: #{fila['expert_url']}"
  puts "Total de proyectos: #{fila['total_project_count']}"
  puts "Total de proyectos en US: #{fila['total_project_count_us']}"
  puts "Especialidades: #{fila['expertises']}"
  puts "--------------------------------"

  hashi[:expert_newsroom_id] << fila[0]
  hashi[:expert_name] << fila[1]

  if fila[3].to_i >= 40 
    hashi[:top_expert_id] << fila[:expert_newsroom_id]
    hashi[:expert_url] << fila[2]
    hashi[:total_project_count_us] << { name: fila[1], project_us: fila[4]}
  end
end

puts "expert_newsroom_id = #{hashi[:expert_newsroom_id].count}"
puts "expert_name = #{hashi[:expert_name][8]}"
puts "top_expert_id = #{hashi[:top_expert_id].count}"
puts "total_project_count_us = #{hashi[:total_project_count_us]}"


hashi[:expert_url].each do |eu|
  puts eu
end



# expert_newsroom_id = 5368
# expert_name = Tillotson Design Associates
# top_expert_id = 7
# total_project_count_us = [{:name=>"Buro Happold", :project_us=>"25"}, {:name=>"Arup", :project_us=>"49"}, {:name=>"Robert Silman Associates", :project_us=>"69"}, {:name=>"AECOM", :project_us=>"6"}, {:name=>"Thornton Tomasetti", :project_us=>"34"}, {:name=>"WSP", :project_us=>"20"}, {:name=>"Gardiner & Theobald", :project_us=>"3"}]
# https://www.archdaily.com/professional/buro-happold
# https://www.archdaily.com/professional/arup
# https://www.archdaily.com/professional/robert-silman-associates
# https://www.archdaily.com/professional/aecom
# https://www.archdaily.com/professional/thornton-tomasetti
# https://www.archdaily.com/professional/wsp
# https://www.archdaily.com/professional/gardiner-theobald
