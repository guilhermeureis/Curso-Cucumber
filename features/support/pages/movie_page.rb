class MoviePage
    include Capybara::DSL

    def add 
        find(".nc-simple-add").click
    end

    def create(movie)
        # Titulo do filme
        find("input[name=title]").set movie["title"]
        # Status do Filme - Combobox com lista
        find("input[placeholder=Status]").click
        find(".el-select-dropdown__item", text: movie["status"]).click
        # Ano de Lançamento
        find("input[name=year]").set movie["year"]
        # Data de Estreia
        find("input[name=release_date]").set movie["release_date"]
        # Atores - adicionando tags de um vetor
        actor = find(".input-new-tag")
        movie["cast"].each do |a|
            actor.set a
            actor.send_keys :tab
        end
        # Descrição do Filme
        find("textarea[name=overview]").set movie["overview"]
        sleep(3) 
    end
end