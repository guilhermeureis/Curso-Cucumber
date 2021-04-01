class MoviePage
    include Capybara::DSL

    def add 
        find(".nc-simple-add").click
    end

    def upload(file)
        cover_file = File.join(Dir.pwd, "features/support/cover/"+file)

        # Converte para modelo do Windows o endereço do arquivo.
        cover_file = cover_file.tr("/","\\") if OS.windows?
        
        # O Capybara é um framework que testa tela. Ele ignora elementos disabilitados.
        # Ignorar os elementos ocultos
        Capybara.ignore_hidden_elements = false
        
        # Faz o anexo da imagem. upcover é o id na página
        attach_file("upcover", cover_file)
        
        # para de Ignorar os elementos ocultos
        Capybara.ignore_hidden_elements = true
    end
    
    def add_cast(cast)
         # Atores - adicionando tags de um vetor
         actor = find(".input-new-tag")
         cast.each do |a|
             actor.set a
             actor.send_keys :tab
         end
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
        # release_date.send_keys :tab
        add_cast(movie["cast"])
        # Descrição do Filme
        find("textarea[name=overview]").set movie["overview"]
        upload(movie["cover"])
        sleep 1
        click_button "Cadastrar"
        sleep 1
    end

    def movie_tr(movie)
        find('table tbody tr', text: movie['title'])
    end
end