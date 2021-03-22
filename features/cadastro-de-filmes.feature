#language: pt

Funcionalidade: Cadastro de filmes
    Para que eu possa disponibilizar novos títulos no catálogo
    Sendo um gestor de catálogo
    Posso cadastrar um novo filme

    @new_movie
    Esquema do Cenario: Novo filme
        O gestor de catálogo cadastrar um novo filme através do fomrulário
        e um novo regitro é inserido no catálogo Ninjaflix.
        
        Dado que <codigo> é um novo filme
        Quando eu faço o cadastro deste filme
        Entao devo ver o novo filme na lista

        Exemplos:
            |codigo     |
            |"ultimato" |
            |"spider"   |
            |"jocker"   |       

    Cenario: Sem nome
        Quando eu tento cadastrar um filme sem o nome
        Entao devo ver a notificação "Oops - Filme sem título. Pode isso Arnaldo?"

    Cenario: Sem status
        Quando eu tento cadastrar um filme sem o status
        Entao devo ver a notificação "Oops - O status deve ser informado!"

    Cenario: Ano de lançamento não informado
        Quando eu tento cadastrar um filme sem o status
        Entao devo ver a notificação "Oops - Faltou o ano de lançamento tabém!"

    Cenario: Data de estréia não informada
        Quando eu tento cadastrar um filme sem o status
        Entao devo ver a notificação "Oops - Quase lá, só falta a data de estréia!"

    Cenario: Duplicado
        Dado que "Deadpoll 2" já foi cadastrado
        Quando eu faço o cadastrado deste filme
        Entao devo ver a notificação "Oops - Este título já existe no Ninjaflix"