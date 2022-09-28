*** Settings ***
Library     SeleniumLibrary
Documentation   Suite description #automated tests for scout website


*** Variables ***
${LOGIN URL}        https://scouts.futbolkolektyw.pl/en/
${BROWSER}      Chrome
${SIGNINBUTTON}     xpath=//div[2]/button[1]/span[1]
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//input[@id='password']
${PAGELOGO}     xpath=//*[@id="__next"]/div[1]/main/div[3]/div[1]/div/div[1]
#tc03
${ADDPLAYERBUTTON}      xpath=//div[2]//button[1]/span[1]
${DATAINPUT}    xpath=//div[2]/div[1]/div[1]//div[1]/input[1]
${NAMEINPUT}    xpath=//div[2]/div[1]/div[1]/input[1]
${SURNAMEINPUT}     xpath=//div[3]/div[1]//input[1]
${AGEINPUT}      xpath=//div[7]//div[1]/input[1]
${POSITIONNPUT}     xpath=//div[11]//input[1]
${SUBMITBUTTON}     xpath=//div[3]/button[1]
#tc log out n change language
${SIGNOUTBUTTON}        xpath=//*[@id="__next"]/div[1]/div/div/div/ul[2]/div[2]
${CHANGELANGUAGEBUTTON}     xpath=//div[1]/ul[2]/div[1]


*** Test Cases ***
Login to the system
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    [Teardown]  Close Browser

Login to the system with wrong password
    Open login page
    Type in email
    Type in wrong password
    Click on the Submit button
    [Teardown]  Close Browser

Adding a player
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    Click on Add player button
    Assert dashboard
    Type in data
    Type in name
    Type in surname
    Type in age
    Type in position
    Click On The Submit Buttonn
    Assert dashboard
     [Teardown]  Close Browser

Adding a player with wrong data
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    Click on Add player button
    Assert dashboard
    Type in wrong data
    Type in name
    Type in surname
    Type in age
    Type in position
    Click On The Submit Buttonn
    Assert dashboard
     [Teardown]  Close Browser

Сhange language
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    Click on language button
    Assert dashboard
    [Teardown]  Close Browser

Logging out
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    Click on Sign out button
    [Teardown]  Close Browser

*** Keywords ***
Open login page
    Open Browser     ${LOGIN URL}       ${BROWSER}
    Title Should Be     Scouts panel - sign in
Type in email
    Input Text    ${EMAILINPUT}     user06@getnada.com
Type in password
    Input Text    ${PASSWORDINPUT}      Test-1234
Click on the Submit button
    Click Element       xpath=//div[2]/button[1]/span[1]
Assert dashboard
    Wait Until Element Is Visible   ${PAGELOGO}
    Title Should Be      PANEL SKAUTINGOWY
#tc02
Type in wrong password
    Input Text    ${PASSWORDINPUT}      Test7777
#tc03
Click on Add player button
    Click Element       ${ADDPLAYERBUTTON}
Type in data
    Input Text      xpath=//div[2]/div[1]/div[1]//div[1]/input[1]     snigana.pylypyuk@gmail.com
Type in name
    Input Text  ${NAMEINPUT}        Sni
Type in surname
    Input Text  ${SURNAMEINPUT}     Zhana
Type in age
    Input Text  ${AGEINPUT}     23.03.2004
Type in position
    Input Text  ${POSITIONNPUT}     goalkeeper
Click On The Submit Buttonn
    Click Element                xpath=//div[3]/button[1]
Click on Sign out button
    Click Element        ${SIGNOUTBUTTON}
Click on language button
    Click Element       ${CHANGELANGUAGEBUTTON}
Type in wrong data
    Input Text          ${DATAINPUT}        snigana