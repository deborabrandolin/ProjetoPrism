Feature: Acesso

@acesso
	Scenario: Navegar pelo site da Vivo
		Given que eu estou no site da Vivo
		When eu clico na caixa de texto meu Vivo
		And eu preencho o campo e-mail
		And eu preencho o campo senha
		And eu clico no botão >
		Then o sistema exibe uma mensagem de erro
