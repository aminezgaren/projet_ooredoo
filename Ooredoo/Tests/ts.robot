*** Settings ***
Library  SeleniumLibrary
Documentation   test suite sur l'espace client

*** Variables ***
${BROWSER 1}        chrome
${BROWSER 2}        firefox
${url}          https://connexion.ooredoo.tn/cas-server/login?service=https://espaceclient.ooredoo.tn/
${phone}        24042092
${password}     123456


*** Test Cases ***
tc1: authentification espace client
    Open espace client
    login


*** Keywords ***
Open espace client
    Open Browser    ${url}      ${BROWSER 1}
    Maximize Browser Window
    Wait Until Element Is Visible    css=.region.region-content    timeout=10s

login
        Input Text    //*[@id="username"]   ${phone}
        Input Text    //*[@id="password"]   ${password}
        Click Button    //*[@id="edit-actions"]/input[2]






