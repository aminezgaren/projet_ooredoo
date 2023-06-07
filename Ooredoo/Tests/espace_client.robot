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
tc1: login valide
    [Tags]  tc1
    Open espace client
    login

tc2: Mes commandes en ligne
    [Tags]  tc2
    Open espace client
    login
    click element  //body/div[7]/div[1]/ul[1]/li[1]/a[1]
    wait until element is visible   //a[contains(text(),'Mes commandes en ligne')]      5s
    click element  //a[contains(text(),'Mes commandes en ligne')]
    wait until location is  https://www.ooredoo.tn/Personal/fr/
    close browser


tc3: Details de mon offre et mes services
    [Tags]  tc3
    Open espace client
    login
    Wait Until Page Contains    Mon Offre et mes services   15s
    click element       //body/div[7]/div[2]/ul[1]/li[1]
    wait until element contains     //*[@id="SelfcareController"]/div[7]/div[2]/ul/li/ul/li[1]/a    Détails de mon offre et de mes services     10s
    click element  //*[@id="SelfcareController"]/div[7]/div[2]/ul/li/ul/li[1]/a
    wait until location is  https://espaceclient.ooredoo.tn/services/details
    close browser

tc4: Suivi de mes transactions
    [Tags]  tc4
    Open espace client
    login
    wait until page contains  Suivi de mes transactions     15s
    click element   //a[contains(text(),'Suivi de mes transactions')]
    wait until page contains element    //div[contains(text(),'Consultez les opérations affectant votre compte du')]    5s
    ${value}    get element attribute  id=datepicker_deb    value
    select from list by label  //select[@id='selectDate']   7 derniers jours
    ${value1}    get element attribute  id=datepicker_deb    value
    should not be equal  ${value}    ${value1}
    Run keyword until sucess    click element   //button[contains(text(),'Afficher')]
    close

tc5: obtenir mon code puk
    [Tags]  tc5
    Open espace client
    login
    wait until page contains  Mon mobile     15s
    click element      //body/div[7]/div[3]/ul[1]/li[1]
    wait until element contains     //body/div[7]/div[3]/div[1]/div[2]/ul[1]/li[2]  Obtenir mon code PUK
    wait until element is enabled  //body/div[7]/div[3]/div[1]/div[2]/ul[1]/li[2]
    Wait Until Element Is Visible    xpath=//li[@ng-repeat="roleBlockMobile in aclMobiles.accessRolesBlocMobile"]
    Run keyword until sucess    click element    //*[@id="SelfcareController"]/div[7]/div[3]/ul/li/ul/li[1]
    wait until page contains  Code PUK
    close
tc6: form
    [Tags]  tc6
    Open espace client
    login
    sleep  10s
    click element   //body/div[7]/div[1]/div[1]/div[2]/ul[1]/li[1]/a[1]
    wait until page contains      Mes informations personnelles
    select radio button  updateProfile[gender]  M
    input text  //input[@id='updateProfile_last_name']      robert
    input text  //input[@id='updateProfile_first_name']     zgaren
    select from list by label   updateProfile_birthday_day    27
    select from list by label  updateProfile_birthday_month     mars
    select from list by label  updateProfile_birthday_year      1995
    input text  //input[@id='updateProfile_email']  amine@gmail.com
    input text  //input[@id='updateProfile_cin']    08776542
    select from list by label  updateProfile_countries  TN
    select from list by label  updateProfile_city   Ariana
    input text  //textarea[@id='updateProfile_address']     rue 15 octobre
    scroll element into view    //*[@id="updateProfile_pictureName"]
    Choose File  id:updateProfile_pictureName       C:/Users/amine/PycharmProjects/Ooredoo/Ressources/img.JPG
    sleep  5s
    Click Element       //*[@id="updateProfile_save"]
    wait until element is visible  //input[@id='updateProfile_pictureName']





*** Keywords ***
Open espace client
    Open Browser    ${url}      ${BROWSER 1}
    Maximize Browser Window
    Wait Until Element Is Visible    css=.region.region-content    timeout=10s

login
        Input Text    //*[@id="username"]   ${phone}
        Input Text    //*[@id="password"]   ${password}
        Click Button    //*[@id="edit-actions"]/input[2]
        wait until location is  https://espaceclient.ooredoo.tn/
close
        sleep  5s
        close browser
Run keyword until sucess
    [Arguments]    ${KW}    @{KWARGS}
    wait until keyword succeeds    10s      1s      ${KW}    @{KWARGS}