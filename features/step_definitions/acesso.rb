Given(/^que eu estou no site da Vivo$/) do
  @home= HomePage.new
  @home.load
end

When(/^eu clico na caixa de texto meu Vivo$/) do
  @home.meuvivo.click
end

When (/^eu preencho o campo e-mail$/) do
  @home.meuvivo.set Faker::Internet.free_email
end

When (/^eu preencho o campo senha$/) do
  @home.senha.set Faker::Internet.password(6)
  sleep(3)
end

When (/^eu clico no botão >$/) do
  @home.entrar.click
end

Then(/^o sistema exibe uma mensagem de erro$/) do

  if @home.msgerro.has_content?('Para sua segurança bloqueamos seu acesso devido às várias tentativas de senha incorretas. Por favor, clique aqui e solicite uma nova senha.') == true
  elsif @home.msgerro.has_content?('Caro cliente, não foram encontrados registros para acesso ao Meu Vivo com os dados informados. clique aqui e efetue seu cadastro.') == true
  elsif @home.msgerro.has_content?('Login ou senha inválidos. Verifique e tente novamente.') == true
  else
  end
end
