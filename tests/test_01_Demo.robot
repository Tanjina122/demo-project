*** Settings ***
Documentation    To validate the login form
Library    SeleniumLibrary

#Resource - we will define it in later lectures

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
    Wait Until Element Is Visible    css:.alert-danger

Verify Error Message Is Correct
    #Decalring variables
    ${errorMessage}=    Get Text    css:.alert-danger
    Should Be Equal As Strings   ${errorMessage}     Incorrect username/password.