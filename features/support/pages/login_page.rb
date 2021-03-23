class LoginPage

    include Capybara::DSL

    def go
        visit "/"
    end

    def with(email, pass)
        find("input[name=email]").set email
        sleep 1
        find("input[name=password]").set pass
        sleep 1
        click_button "Entrar"
        sleep 2
    end

    def alert
        find(".alert").text
    end

end