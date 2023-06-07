*** Settings ***
Library  SeleniumLibrary
Documentation   Test Basic sur SeleniumLibrary

*** Variables ***
${BROWSER 1}        chrome
${BROWSER 2}        firefox
${url}          https://connexion.ooredoo.tn/cas-server/login?service=https://espaceclient.ooredoo.tn/


*** Test Cases ***
tc01
    Open navigator


*** Keywords ***
Open navigator
    Open Browser    ${url}      ${BROWSER 1}
    Maximize Browser Window
        Input Text    //*[@id="username"]    24042092
        Input Text    //*[@id="password"]    123456
        Click Button    //*[@id="edit-actions"]/input[2]
        sleep  10s
        click element    //body/div[7]/div[1]/ul[1]/li[1]/a[1]
        sleep  5s





