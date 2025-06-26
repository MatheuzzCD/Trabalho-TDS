```robotframework
*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
Acessar o site do SauceDemo
    Dado que o usuário navega até a página do SauceDemo

Efetuar login com dados corretos
    Dado que o usuário navega até a página do SauceDemo
    Quando ele insere o usuário "standard_user" e a senha "secret_sauce"
    E pressiona o botão de login
    Então o acesso à conta deve ser bem-sucedido

Verificar a falha no login com dados incorretos
    Dado que o usuário navega até a página do SauceDemo
    Quando ele insere o usuário "standard_user" e a senha "senhamuitoErrada"
    E pressiona o botão de login
    Então uma mensagem de erro precisa ser mostrada

Sair do sistema após o login
    Dado que o usuário navega até a página do SauceDemo
    Quando ele insere o usuário "standard_user" e a senha "secret_sauce"
    E pressiona o botão de login
    E abre o menu de navegação
    E seleciona a opção de sair
    Então a sessão do usuário precisa ser encerrada

*** Keywords ***
Dado que o usuário navega até a página do SauceDemo
    Open Browser    https://www.saucedemo.com/v1/    firefox
    Maximize Browser Window

Quando ele insere o usuário "usuario"easenha"{senha}"
    Input Text    //input[contains(@type,'text')]    ${usuario}
    Input Text    //input[contains(@type,'password')]    ${senha}

E pressiona o botão de login
    Click Element    //input[contains(@type,'submit')]
    Sleep    3s

Então o acesso à conta deve ser bem-sucedido
    Page Should Contain Element    //div[contains(@class,'inventory_list')]

Então uma mensagem de erro precisa ser mostrada
    Page Should Contain    Epic sadface: Username and password do not match

E abre o menu de navegação
    Click Element    //button[contains(.,'Open Menu')]

E seleciona a opção de sair
    Click Element    //a[contains(.,'Logout')]

Então a sessão do usuário precisa ser encerrada
    Page Should Contain Element    //input[contains(@type,'submit')]
```
