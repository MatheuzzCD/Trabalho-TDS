*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
Iniciar o procedimento de checkout
    Dado que o usuário já está logado no sistema
    Quando ele adiciona um item ao carrinho
    E navega até a página do carrinho
    E inicia a finalização da compra
    Então a página de dados do cliente deve ser mostrada

Completar o formulário com informações obrigatórias
    Dado que o usuário está na página de dados do cliente
    Quando ele insere seu nome
    E insere seu sobrenome
    E insere o CEP
    E prossegue com a compra
    Então o resumo do pedido deve aparecer

Verificar o resumo do pedido
    Dado que o usuário está na página de resumo do pedido

Concluir a compra e checar a mensagem de sucesso
    Dado que o usuário está na página de resumo do pedido
    Quando ele conclui a compra

*** Keywords ***
Dado que o usuário já está logado no sistema
    Open Browser    https://www.saucedemo.com/v1/    firefox
    Maximize Browser Window
    Input Text    //input[contains(@type,'text')]    standard_user
    Input Text    //input[contains(@type,'password')]    secret_sauce
    Click Element    //input[contains(@type,'submit')]
    Sleep    2s

Quando ele adiciona um item ao carrinho
    Click Element    (//button[@class='btn_primary btn_inventory'][contains(.,'ADD TO CART')])[1]

E navega até a página do carrinho
    Click Element    //a[contains(@class,'shopping_cart_link')]

E inicia a finalização da compra
    Click Element    //a[contains(@class,'checkout_button') and text()='CHECKOUT']

Então a página de dados do cliente deve ser mostrada
    Page Should Contain Element    //input[@data-test='firstName']

Dado que o usuário está na página de dados do cliente
    Dado que o usuário já está logado no sistema
    Quando ele adiciona um item ao carrinho
    E navega até a página do carrinho
    E inicia a finalização da compra

Quando ele insere seu nome
    Input Text    //input[@data-test='firstName']    Fulano

E insere seu sobrenome
    Input Text    //input[@data-test='lastName']    Silva

E insere o CEP
    Input Text    //input[@data-test='postalCode']    12345-678

E prossegue com a compra
    Click Element    //input[@class='btn_primary cart_button' and @type='submit' and @value='CONTINUE']

Então o resumo do pedido deve aparecer
    Page Should Contain Element    //div[@class='summary_info']

Dado que o usuário está na página de resumo do pedido
    Dado que o usuário está na página de dados do cliente
    Quando ele insere seu nome
    E insere seu sobrenome
    E insere o CEP
    E prossegue com a compra

Então deve exibir o produto no resumo    ${xpath}
    Page Should Contain Element    ${xpath}

Quando ele conclui a compra
    Click Element    //a[contains(@class,'cart_button') and text()='FINISH']
