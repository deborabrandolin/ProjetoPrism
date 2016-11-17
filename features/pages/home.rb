class HomePage < SitePrism::Page
  include Capybara::DSL
  set_url "http://www.vivo.com.br/portalweb/appmanager/env/web"

  element :meuvivo, :id, "cpfOuEmail"
  element :senha, :id, "senhaText"
  element :entrar, :id, "btnEntrar"
  element :msgerro, :xpath, "//*[@id='msn_erro_email']/div[2]/div"
end
