# Com o page object o arquivos "steps"
# Ficou mais limpa, simples e objetiva
# Uma step definition não deve conter tanta lógica assim. Ele tem que ser pequena e muito simples.
# Usar o mínimo de lógica

Quando('eu faço login com {string} e {string}') do |email, senha|
    @login_page.go
    @login_page.with(email, senha)
end
  
Entao('devo ser autenticado') do
    expect(get_token.length).to be 147
end
  
Entao('devo ver {string} na área logada') do |expect_name|
    expect(@sidebar.logged_user).to eql expect_name
end

Entao('não devo ser autenticado') do
    expect(get_token).to be nil
end
  
Entao('devo ver a mensagem de alerta {string}') do |expect_message|
    expect(@login_page.alert).to eql expect_message    
end
  