*** Settings ***

Documentation    Suite de teste relacionado a funcionalidade pix

Resource         ${EXECDIR}/Resources/base.robot

Library          ${EXECDIR}/Resources/Factories/pix.py

Test Setup       Start Session
Test Teardown    End Session

*** Test Case ***

Cenario 2: Fazer PIX
    [Tags]                           pix_valido

    ${pix_valido}                    Factory Pix Valido
    # Dado que meu saldo é de R$ 1000
    # E acesso a home nBank
    # Quando faço um PIX no valor de R$ 100
    Go To PIX Form
    Fill PIX Form                    ${pix_valido}
    Submit Pix Form
    # Então meu saldo final deve ser de R$ 900
    Check The Balance
    # E a transação em questão é adicionada no meu Extrato
    Transaction Should Be Visible    ${pix_valido}



Cenario 3: PIX com valor ZERO
    [Tags]                           pix_zerado

    ${pix_zerado}                    Factory Pix Zerado
# Dado que meu saldo é de R$ 1000
# E acesso a home nBank
# Quando faço um PIX no valor de R$ 0
    Go To PIX Form
    Fill PIX Form                    ${pix_zerado}
    Submit Pix Form
# Então vejo a mensgem de alerta "Oops. Transferir ZERO é osso hein..."
    Error Message Should Be          Oops. Transferir ZERO é osso hein...



Cenario 4: PIX com valor NEGATIVO
    [Tags]                           pix_negativo

    ${pix_negativo}                  Factory Pix Negativo
# Dado que meu saldo é de R$ 1000
# E acesso a home nBank
# Quando faço um PIX no valor de R$ -1
    Go To PIX Form
    Fill PIX Form                    ${pix_negativo}
    Submit Pix Form

# Então vejo a mensgem de alerta "Oops. Valor para PIX incorreto..."
    Error Message Should Be          Oops. Valor para PIX incorreto...
