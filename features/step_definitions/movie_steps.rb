Dado('que {string} é um novo filme') do |movie_code|
    # YAML.load_file acessa o arquivo YAML
    # File.join acessa o local do arquivo
    # Dir.pwd está setando a raiz do projeto e depois é passado o caminho do arquivo yaml
    file = YAML.load_file(File.join(Dir.pwd, "features/support/fixtures/movies.yaml"))
    @movie = file[movie_code]
    Database.new.delete_movie(@movie["title"])
end
  
Quando('eu faço o cadastro deste filme') do
    @movie_page.add
    @movie_page.create(@movie)
end

Dado('este filme já existe no catálogo') do
    Database.new.insert_movie(@movie)
end
  
Entao('devo ver o novo filme na lista') do
    result = @movie_page.movie_tr(@movie)
    expect(page).to have_text @movie["title"]
    expect(page).to have_text @movie["status"]
end

Entao('devo ver a notificação {string}') do |expect_alert|
    expect(@movie_page.alert).to include(expect_alert)
end