*** Settings ***
Library  Selenium2Library
Suite Setup     Go to homepage
Suite Teardown  Close All Browsers

*** Variables ***
${HOMEPAGE}     https://hotline.ua/
${BROWSER}      chrome
${TEXT}

*** Test Cases ***
Find iPhone 7 on Hotline
   Input Text       id = searchbox    iPhone 7
   Click Button     id = doSearch
   Wait Until Page Contains Element     xpath = //p[@data-result-title]
   ${TEXT}         Get Text  xpath = //p[@data-result-title]
   Log to console     ${TEXT}
   Wait Until Page Contains Element     xpath = //ul[@class='products-list cell-list']/li[1]/div[@class='item-info']/div[@class='info-description']/p/a
   Click Element    xpath = //ul[@class='products-list cell-list']/li[1]/div[@class='item-info']/div[@class='info-description']/p/a



*** Keywords ***
Go to homepage
    Open Browser    ${HOMEPAGE}         ${BROWSER}

