Quando('eu faço login com {string} e {string}') do |email, senha|
    visit '/'
    sleep 1
    find("#emailId").set email
    find("#passId").set senha
    click_button "Entrar"
    sleep 3
end
  
Entao('devo ser autenticado') do
    js_script = 'return window.localStorage.getItem("default_auth_token");'
    token = page.execute_script(js_script)
    expect(token.length).to be 147
end
  
Entao('devo ver {string} na área logada') do |expect_name|
    user = find('.sidebar-wrapper .user .info span')
    expect(user.text).to eql expect_name
end

Entao('não devo ser autenticado') do
    js_script = 'return window.localStorage.getItem("default_auth_token");'
    token = page.execute_script(js_script)
    expect(token).to be nil
end
  
Entao('devo ver a mensagem de alerta {string}') do |expect_message|
    alert = find(".alert")
    expect(alert.text).to eql expect_message    
end
  