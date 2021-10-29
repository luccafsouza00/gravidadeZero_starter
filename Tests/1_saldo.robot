*** Settings ***

Documentation    Suite de teste relacionados ao saldo

Resource         ${EXECDIR}/Resources/base.robot

Test Setup       Start Session
Test Teardown    End Session


*** Test Cases ***

Cenario 1: Consulta Saldo
    [Tags]               saldo

    # Quando acesso a home nBank
    # Então devo ver meu saldo inicial no valor de R$ 1000

    #checkout para garantir que a aplicação esta online
    Get Title            equal     nBank by QAninja

    Check The Balance    Papito    1000
