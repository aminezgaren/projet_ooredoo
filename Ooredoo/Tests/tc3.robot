*** Settings ***
Library  SeleniumLibrary
Documentation   Test Basic sur SeleniumLibrary
Library     SeleniumLibrary
Library  SeleniumLibrary
*** Variables ***
${BROWSER 1}        chrome
${BROWSER 2}        firefox
${url}       https://www.ooredoo.tn/Personal/fr/content/500-nos-boutiques


*** Test Cases ***
tc01
     ${options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Add Argument  ${options}  --disable-source-maps
    Create WebDriver  Chrome  options=${options}
    Go To  https://www.ooredoo.tn/Personal/themes/leo_epharma/modules/leoquicklogin/views/
    # Continue with your test steps
    Close All Browsers


*** Keywords ***
Open navigator
    Open Browser    ${url}      ${BROWSER 1}
    Maximize Browser Window






