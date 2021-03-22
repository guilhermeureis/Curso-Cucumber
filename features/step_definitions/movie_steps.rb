Dado('que {string} é um novo filme') do |movie_code|
    # YAML.load_file acessa o arquivo YAML
    # File.join acessa o local do arquivo
    # Dir.pwd está setando a raiz do projeto e depois é passado o caminho do arquivo yaml
    file = YAML.load_file(File.join(Dir.pwd, "features/support/fixtures/movies.yaml"))
    puts file
end
  
Quando('eu faço o cadastro deste filme') do
    pending # Write code here that turns the phrase above into concrete actions
end
  
Entao('devo ver o novo filme na lista') do
    pending # Write code here that turns the phrase above into concrete actions
end