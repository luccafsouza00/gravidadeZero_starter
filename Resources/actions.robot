*** Settings ***

Documentation    Ações customizadas do nBank

*** Keywords ***


Check The Balance
    [Arguments]                ${usuario}                                                                 ${valor_saldo}
    
    Wait For Elements State
    ...                        css=.navbar-item >> text= Olá ${usuario}, seu saldo é R$ ${valor_saldo}
    ...                        visible                                                                    5

Go To PIX Form
    Click                      css=.button >> text=Fazer PIX

Fill PIX Form
    [Arguments]                ${pix_form}

    Select Options By          css=.field select                                                          value                                                           ${pix_form}[banco]
    Fill Text                  css=#chave-pix                                                             ${pix_form}[chave_pix]
    Fill Text                  css=#valor                                                                 ${pix_form}[valor]

Submit Pix Form
    Click                      css=button >> text= Enviar PIX

Transaction Should Be Visible
    [Arguments]                ${pix_informations}

    ${element}                 Set Variable                                                               xpath=//td[contains(text(),"${pix_informations}[banco]")]/..

    Wait For Elements State    ${element}                                                                 visible                                                         5
    Get Text                   ${element}                                                                 contains                                                        ${pix_informations}[valor]
    Get Text                   ${element}                                                                 contains                                                        ${pix_informations}[chave_pix]
    Get Text                   ${element}                                                                 contains                                                        ${pix_informations}[banco]

Error Message Should Be
    [Arguments]                ${expected_message}

    Wait For Elements State
    ...                        css=.message >> text= ${expected_message}
    ...                        visible