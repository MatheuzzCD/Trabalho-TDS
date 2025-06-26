*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
Incluir itens no carrinho de compras
    Dado que o usuário já está logado na plataforma
    Quando ele adiciona um item ao carrinho
    Então o carrinho deve exibir o produto

Excluir itens do carrinho
    Dado que o usuário já está logado na plataforma
    Quando ele adiciona um item ao carrinho
    E remove o item do carrinho
    Então o carrinho não deve mais conter o produto

Confirmar se os itens adicionados estão corretos
    Dado que o usuário já está logado na plataforma
    Quando ele adiciona o produto ao carrinho
    E adiciona o mesmo produto ao carrinho novamente
    Então o carrinho deve exibir o produto

*** Keywords ***
Dado que o usuário já está logado na plataforma
    Open Browser    https://www.saucedemo.com/v1/    firefox
    Maximize Browser Window
    Input Text    //input[contains(@type,'text')]    standard_user
    Input Text    //input[contains(@type,'password')]    secret_sauce
    Click Element    //input[contains(@type,'submit')]
    Sleep    2s

Quando ele adiciona um item ao carrinho
    Click Element    (//button[@class='btn_primary btn_inventory'][contains(.,'ADD TO CART')])[1]

E remove o item do carrinho
    Click Element    //button[@class='btn_secondary btn_inventory'][contains(.,'REMOVE')]

Então o carrinho deve exibir o produto
    Click Element    //a[contains(@class,'shopping_cart_link')]
Então o carrinho não deve mais conter o produto
    Click Element    //a[contains(@class,'shopping_cart_link')]
