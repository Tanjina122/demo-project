*** Settings ***
Documentation    To validate the login form
Library    SeleniumLibrary
Test Teardown    Close Browser

#Resource - we will define it in later lectures

*** Variables ***
${Login_Error_Mesage_Css}=    css:.alert-danger

*** Test Cases ***
Validate Unsuccessful Login
    Open The Browser With The Mortage Payment Url
    File The Login Form
    Wait Until It Checks And Display Error Message
    Verify Error Message Is Correct

*** Keywords ***
Open The Browser With The Mortage Payment Url
    Create Webdriver    Chrome
    Go To    https://rahulshettyacademy.com/loginpagePractise/#

File The Login Form
    Input Text    id:username    nazmulmahealam
    Input Text    id:password    123456
    Click Button    signInBtn

Wait Until It Checks And Display Error Message
    #Test variables using in steps
    Wait Until Element Is Visible    ${Login_Error_Mesage_Css}

Verify Error Message Is Correct
    ${errorMessage}=    Get Text    css:.alert-danger
    Should Be Equal As Strings   ${errorMessage}     Incorrect username/password.
    #Below code is giving the same comparison but in selenium framework
    Element Text Should Be    ${Login_Error_Mesage_Css}    Incorrect username/password.
