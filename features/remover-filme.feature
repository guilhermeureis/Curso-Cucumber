#language:pt
@login
Funcionalidade: Remover filme
    Para que eu possa manter o catálogo atualizado
    Sendo um gestor de catálogo que encontrou um título cancelado/indesejado ou que não tem uma boa aceitação pelo público
    Posso remover este item

    @rm_movie
    Cenario: Excluir filme
        Dado que "dbz" está no catálogo
        Quando eu solicito a exclusão
        E eu confirmo a solicitação
        Entao este item dever ser removido do catálogo

    @no_rm_movie
    Cenario: Cancelar da exclusão
        Dado que "10_coisas" está no catálogo
        Quando eu solicito a exclusão
        Mas cancela a solicitação
        Entao este item deve permanecer no catálogo
