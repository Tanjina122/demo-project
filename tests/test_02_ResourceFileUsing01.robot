*** Settings ***
Documentation    To validate the login form
Library    SeleniumLibrary
#This has come from resource.robot file
Test Setup    Open The Browser With The Rahul Shetty Url


#this is resource file which will be used throughout the test
Resource    resource.robot

#Resource - we will define it in later lectures

*** Variables ***
${Login_Error_Mesage_Css}=    css:.alert-danger

*** Test Cases ***
Validate Unsuccessful Login
    File The Login Form
    Wait Until It Checks And Display Error Message
    Verify Error Message Is Correct

*** Keywords ***


File The Login Form
                                #user name has come from resource file
    Input Text    id:username    ${user_name}
                                #passrod has come from resource file
    Input Text    id:password    ${invalid_Password}
    Click Button    signInBtn

Wait Until It Checks And Display Error Message
    Wait Until Element Is Visible    ${Login_Error_Mesage_Css}

Verify Error Message Is Correct
    ${errorMessage}=    Get Text    css:.alert-danger
    Should Be Equal As Strings   ${errorMessage}     Incorrect username/password.
    #Below code is giving the same comparison but in selenium framework
    Element Text Should Be    ${Login_Error_Mesage_Css}    Incorrect username/password.
