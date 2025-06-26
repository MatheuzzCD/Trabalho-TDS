*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
Verificar a visualização do catálogo de produtos após o login
    Dado que o usuário acessa a plataforma SauceDemo
    Quando ele insere o usuário "standard_user" e a senha "secret_sauce"
    E pressiona o botão para entrar
    Então o catálogo de produtos deve ser visível

Examinar os detalhes de um item
    Dado que o usuário já está logado no sistema
    Quando ele seleciona um item na lista de produtos
    Então as informações detalhadas do produto devem ser exibidas

Classificar os produtos por ordem alfabética
    Dado que o usuário já está logado no sistema
    Quando ele escolhe a organização por "Name (Z to A)"
    Então os produtos precisam ser listados em ordem decrescente de nome

Classificar os produtos por preço
    Dado que o usuário já está logado no sistema
    Quando ele escolhe a organização por "Price (low to high)"
    Então os produtos precisam ser listados do menor para o maior preço

*** Keywords ***
Dado que o usuário acessa a plataforma SauceDemo
    Open Browser    https://www.saucedemo.com/v1/    firefox
    Maximize Browser Window

Quando ele insere o usuário "${usuario}" e a senha "${senha}"
    Input Text    //input[contains(@type,'text')]    ${usuario}
    Input Text    //input[contains(@type,'password')]    ${senha}

E pressiona o botão para entrar
    Click Element    //input[contains(@type,'submit')]
    Sleep    2s

Então o catálogo de produtos deve ser visível
    Page Should Contain Element    //div[contains(@class,'inventory_list')]

Dado que o usuário já está logado no sistema
    Dado que o usuário acessa a plataforma SauceDemo
    Quando ele insere o usuário "standard_user" e a senha "secret_sauce"
    E pressiona o botão para entrar

Quando ele seleciona um item na lista de produtos
    Click Element    (//div[@class='inventory_item_name'])[1]

Então as informações detalhadas do produto devem ser exibidas
    Page Should Contain Element    //div[@class='inventory_details_desc_container']

Quando ele escolhe a organização por "${criterio}"
    Select From List By Label    //select[@class='product_sort_container']    ${criterio}
    Sleep    1s

Então os produtos precisam ser listados em ordem decrescente de nome
    Element Text Should Be    (//div[@class='inventory_item_name'])[1]    Sauce Labs Backpack

Então os produtos precisam ser listados do menor para o maior preço
    Element Text Should Be    (//div[@class='inventory_item_price'])[1]    $7.99
