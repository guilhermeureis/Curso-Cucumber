class MoviePage
    include Capybara::DSL

    # Criando um construtor porque é utilizada em vários métodos
    def initialize
        @movie_list_css = "table tbody tr"
    end

    def form
        MovieAdd.new
    end

    def sweet_alert
        SweetAlert.new
    end

    def movie_tr(title)
        sleep 1
        find(@movie_list_css, text: title)
    end

    def add 
        find(".nc-simple-add").click
    end

    def remove(title)
        movie_tr(title).find(".btn-trash").click
    end

    

    def has_no_movie(title)
        # Perguntando se não contem o filme
        page.has_no_css?(@movie_list_css, text: title)
    end

    def has_movie(title)
        # Perguntando não contem o filme
        page.has_css?(@movie_list_css, text: title)
    end
end