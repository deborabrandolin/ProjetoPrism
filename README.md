<h1>Testes Automatizados utilizando - Cucumber/Capybara (WEB)</h1>

 <h2>Requisitos</h2>
 
    RVM instalado https://rvm.io/
    Gem Bundler Instalado http://bundler.io/
    Gem Testgen https://github.com/cheezy/testgen


<h2>Instalações</h2>

<h3>RVM (Ruby Version Manager)</h3>
Para instalar o RVM é necessário executar na linha de comando <strong>"curl -sSl https://get.rvm.io | bash -s stable"</strong> (Ao instalar o RVM com o "bash -s stable", também é instalado a ultima versão estável do Ruby na sua maquina).

<h3>Gem Bundler (Bundler é uma gem para gerenciamento e instalação de pacotes)</h3>
Após instalar o RVM com a ultima versão estável do Ruby, é necessário instalar a gem Bundler.
Para isso, é necessário executar na linha de comando <strong>"gem install bundler"</strong>, assim todas as depêndencias para utilizar a gem bundler serão instaladas.

<h3>Gem Testgen (Tesgen é uma gem para criação de projetos)</h3>
Após instalar o RVM com a ultima versão estável do Ruby, é necessário instalar a gem Testgen.
Para isso, é necessário executar na linha de comando <strong>"gem install testgen"</strong>, assim todas as depêndencias para utilizar a gem testgen serão instaladas.

<h2>Criando um Novo Projeto</h2>

Após ter todas as depêndencias devidamente instaladas, será necessário iniciar um novo projeto utilizando do Testgen.
Para isso, será necessário executar na linha de comando <strong>"testgen project nomedoseuprojeto --pageobject-driver=selenium"</strong> (Essa parte => "--pageobject-driver=selenium" é opcional, porém, ela ja inclui a gem page-object e o driver default como selenium no seu projeto).

<h3>Um Projeto com a seguinte estrutura será criado:</h3>

![example_1](http://i.imgur.com/bdcwKj8.png)

<h2>Estrutura Padrão do Projeto</h2>

<h3>1) Gemfile</h3>

Adicione as Seguintes Gems para que seu projeto fique igual ao exemplo (Relaxe, essas gems adicionais serão explicadas em breve):

![example_2](http://i.imgur.com/lzPPdey.png)

O Gemfile, é onde todas as depêndencias do seu projeto devem ser instaladas, logo quando seu projeto é baixado, será necessário apenas rodar o comando "bundle install" e todas as depêndencias localizadas no seu gemfile serão instaladas direto na maquina (Lembre-se sempre, que ao adicionar uma gem no seu projeto, ela deve ser adicionada também no seu gemfile para que futuros usuarios do seu projeto não tenham problemas para utiliza-lo).

<h3>2) Env.rb</h3>

![example_7](http://i.imgur.com/gZTOjht.png)

O arquivo Env.rb é onde será configurado seu ambiente de testes.
Logo devemos utilizar um require para cada gem que será utilizada.
Como pode ser visto no exemplo, neste caso além de definirmos as gems que serão utilizadas no projeto, também é possivel ver as linhas 
<strong>Capybara.default_driver = :selenium</strong> e <strong>Capybara.page.driver.browser.manage.window.maximize</strong>.

A primeira linha "Capybara.default_driver = :selenium" define que o driver padrão que será utilizado no projeto, será o selenium-webdriver.
A segunda linha "Capybara.page.driver.browser.manage.window.maximize" define que ao iniciar algum teste que dependa de um browser, ele sempre irá maximizar o browser antes de iniciar o cenário e apenas depois que ocorrerão os testes.

<h3>3) Feature</h3>

![example_3](http://i.imgur.com/rpFt8ZU.png)

A pasta Feature é o local onde serão armazenados todos os casos de teste do projeto, lembrando-se sempre que ao criar um novo caso de teste, ele deve conter ".feature" no fim do nome.
Os casos de Testes são sempre escritos em Gherkin (Linguagem em que o cucumber interpreta os casos de Testes).
O Gherkin padrão deve sempre ser escrito em inglês, porém é possível mudar seu padrão de leitura para portugues adicionando um simples "#language: pt" na primeira linha da sua feature, como pode ser visto no exemplo:

![example_4](http://i.imgur.com/iYRa2ns.png)

O Gherkin sempre deve apresentar o que essa "Feature/Funcionalidade" faz e sempre deve seguir um padrão na criação de Cenários, como a do exemplo acima.
Também é necessário seguir sua syntaxe no momento de criação de Cenários.
Sempre utilizando

1. "Dado"/"Given"                          
2. "Quando"/"When"     
3. "E"/"And"
4. "Então"/"Then"
 
<h2>Ex:</h2>

    Dado que estou na pagina "google.com"
    E efetuo uma pesquisa "pesquisa" em "campo de pesquisa"
    Quando clico em "pesquisar"
    Então espero que exista "resultado"
    
<h2>ou</h2>

    Given i am at "google.com"
    And i want to search "search" in "search_field"
    When i click on "search_button"
    Then i expect to find "results"
    
Quando uma feature é executada (para executa-la basta digitar o comando <strong>"cucumber"</strong> ou o comando <strong>"cucumber features/nomedasuafeature.feature"</strong> dentro da pasta raíz do seu projeto), automaticamente será gerado parte do código que será necessário no seu arquivo step_definitions.rb (caso você não possua um, basta criar um arquivo chamado "step_definitions.rb" dentro da sua pasta step_definitions).

![example_6](http://i.imgur.com/UzVXlUP.png)

Todo o código apartir de "<strong>You can implement step definitions for undefined steps with these snippets:</strong>" pode ser copiado e colado dentro do seu arquivo step_definitions.rb.
Será apartir dele que você criara os primeiros comandos que serão executados pelas suas features.
    
<h3>4) Step Definitions</h3>

![example_5](http://i.imgur.com/6nxue5H.png)

O Arquivo "step_definitions.rb" dentro da pasta "step_definitions", é o local em que o seu código será escrito.
Apartir do código que foi gerado ao executar o cucumber apenas com a sua feature definida, é possível iniciar a criação das steps que serão usadas nos seus cenários. 
Basta colar o código que foram exibidos ao executar o comando cucumber e substituir os campos que se encontram como "pendentes".

Ao colar o código no seu arquivo step_definitions.rb, ele deve ficar assim:

![example_8](http://i.imgur.com/LNGBr8S.png)

Para preencher os campos da forma correta, será necessário utilizar dos respectivos passos que o capybara já possui preparado para cada tipo de situação:

![example_9](http://i.imgur.com/1f854eg.png)

Exemplos de possíveis interações:

![example_10](http://i.imgur.com/FpaWqtV.png)

No caso do nosso step anterior, ficaria:

Dado(/^que estou no site da globo$/) do<br>
 visit("www.globo.com.br")<br>
end

Caso todas as suas steps sejam preenchidas corretamente. Ao executar o comando cucumber dentro da pasta do projeto, deverá ser exibido o seguinte caso:

![example_11](http://i.imgur.com/AtFyGkU.png)

<h2>.:.Lembrando que a pasta "exemplo" do repositório ja contém um projeto configurado e com algumas steps criadas com a explicação sobre a execução de cada comando executado.:.</h2>









