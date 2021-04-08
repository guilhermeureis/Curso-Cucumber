class SideBarView
    include Capybara::DSL

    # Classe que acessa o MENU    
    def logged_user
        find(".sidebar-wrapper .user .info span").text
    end
end
