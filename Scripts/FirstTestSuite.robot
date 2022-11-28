*** Settings ***
Suite Setup    Open page    ${vURL}    ${vBrowser}    
Suite Teardown     Close Browser    
Test Setup
Test Teardown

Library    SeleniumLibrary
Variables    ../Ressources/Locators/Locators.py
Resource    ../Ressources/Keywords/Keywords.robot

*** Variables ***
${vURL}    https://practicetestautomation.com/practice-test-login/
${vBrowser}    chrome
${vUsername}    student
${vPassword}    Password123 
${Attempted_URL}    https://practicetestautomation.com/logged-in-successfully/
${expected_Element_Text}    Log out

*** Test Cases ***
Test case 1: Positive LogIn test
    Login    ${vUsername}    ${vPassword}
    Verify page URL & Contains    ${Attempted_URL}
    Verify Element    ${expected_Element_Text}
    LogOut

Test case 2: Negative username test
    #To reuse the Keyword you just have to change the parameters
    Login    incorrectUser     ${vPassword}
    Verify error message    ${Error_Msge_Locator}    Your username is invalid!

Test case 3: Negative password test
    #To reuse the Keyword you just have to change the parameters
    Login    ${vUsername}     incorrectPassword 
    Verify error message    ${Error_Msge_Locator}    Your password is invalid!

    

