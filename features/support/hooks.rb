Before do
    @login_page = LoginPage.new
    @movie_page = MoviePage.new
    @sidebar = SideBarView.new

    # Maximizar a janela
    # page.driver.browser.manage.window.maximize
    # Boa prática é definir o tamanho mínimo da janela
     page.current_window.resize_to(1440,900)
end

Before("@login") do
    @login_page.go
    @login_page.with("tony@stark.com","pwd123")
end
