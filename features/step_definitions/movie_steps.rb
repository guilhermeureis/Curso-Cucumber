Dado('que {string} é um novo filme') do |movie_code|
    # YAML.load_file acessa o arquivo YAML
    # File.join acessa o local do arquivo
    # Dir.pwd está setando a raiz do projeto e depois é passado o caminho do arquivo yaml
    file = YAML.load_file(File.join(Dir.pwd, "features/support/fixtures/movies.yaml"))
    @movie = file[movie_code]
end
  
Quando('eu faço o cadastro deste filme') do
    @movie_page.add
    @movie_page.create(@movie)
end
  
Entao('devo ver o novo filme na lista') do
    pending # Write code here that turns the phrase above into concrete actions
end