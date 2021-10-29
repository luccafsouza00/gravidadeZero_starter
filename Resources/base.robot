*** Settings ***

Documentation    Arquivo base do projeto

Library          Browser
Library          String
Library          BuiltIn

Resource         actions.robot

*** Variables ***

${BASE_URL}      https://nbank.vercel.app

*** Keywords ***

Start Session
    New Browser        chromium       headless=False    slowMo=00:00:01
    New Page           ${BASE_URL}

End Session
    Take Screenshot

