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
    @movie_page.form.create(@movie)
end

Dado('este filme já existe no catálogo') do
    Database.new.insert_movie(@movie)
end
  
Entao('devo ver o novo filme na lista') do
    result = @movie_page.movie_tr(@movie["title"])
    expect(page).to have_text @movie["title"]
    expect(page).to have_text @movie["status"]
end

Entao('devo ver a notificação {string}') do |expect_alert|
    expect(@movie_page.form.alert).to include(expect_alert)
end

Dado('que {string} está no catálogo') do |movie_code|
    steps %{
        Dado que "#{movie_code}" é um novo filme
        E este filme já existe no catálogo
    }
end

Quando('eu solicito a exclusão') do
    @movie_page.remove(@movie["title"])
end

Quando('eu confirmo a solicitação') do
    @movie_page.sweet_alert.confirm
end

Entao('este item dever ser removido do catálogo') do
    expect(@movie_page.has_no_movie(@movie['title'])).to be true
end

Quando('cancela a solicitação') do
    @movie_page.sweet_alert.cancel
end
  
Entao('este item deve permanecer no catálogo') do
    expect(@movie_page.has_movie(@movie['title'])).to be true
end